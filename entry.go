package main

import (
	"os"
	"os/signal"
	"syscall"
)

// terminationSignals are those signals that the entry point considers to be
// requesting termination.
var terminationSignals = []os.Signal{
	syscall.SIGINT,
	syscall.SIGTERM,
	// TODO: We may want to consider expanding this list.
}

func main() {
	// Set up signal handling.
	signalTermination := make(chan os.Signal, 1)
	signal.Notify(signalTermination, terminationSignals...)

	// Wait for termination.
	<-signalTermination
}
