// Copyright (c) 2021 Oasis Labs Inc. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
// 1. Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
// IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
// TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package ed25519

import (
	"crypto/rand"
	"fmt"

	"github.com/oasisprotocol/curve25519-voi/primitives/ed25519"
)

// ExampleVerificationBehavior demonstrates the configurable verification
// behavior.
func ExampleVerificationBehavior() { //nolint: govet
	// As alluded to in ExampleBasic, there are currently many definitions
	// of Ed25519 signature verification in the wild.
	//
	// To navigate this, curve25519-voi provides a "sensible" default,
	// and also supporting verification behavior that exactly matches
	// other common implementations (within reason).

	msg := []byte("test message")

	publicKey, privateKey, err := ed25519.GenerateKey(rand.Reader)
	if err != nil {
		panic("ed25519.GenerateKey: " + err.Error())
	}
	sig := ed25519.Sign(privateKey, msg)

	// FIPS 186-5 (aka RFC 8032 with cofactored verification)
	opts := &ed25519.Options{
		Verify: ed25519.VerifyOptionsFIPS_186_5,
	}
	if !ed25519.VerifyWithOptions(publicKey, msg, sig, opts) {
		panic("ed25519.VerifyWithOptions(FIPS_186_5): failed")
	}

	// ZIP-215 (aka ed25519consensus)
	opts = &ed25519.Options{
		Verify: ed25519.VerifyOptionsZIP_215,
	}
	opts.Verify = ed25519.VerifyOptionsZIP_215
	if !ed25519.VerifyWithOptions(publicKey, msg, sig, opts) {
		panic("ed25519.VerifyWithOptions(default): failed")
	}

	// Go standard library (crypto/ed25519)
	opts.Verify = ed25519.VerifyOptionsStdLib
	if !ed25519.VerifyWithOptions(publicKey, msg, sig, opts) {
		panic("ed25519.VerifyWithOptions(StdLib): failed")
	}

	fmt.Println("ok")
	// Output: ok
}
