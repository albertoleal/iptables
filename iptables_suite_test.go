package iptables_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"testing"
)

func TestIPtables(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "IPtables Suite")
}
