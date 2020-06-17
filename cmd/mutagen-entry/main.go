package main

import (
	"os"
	"os/signal"

	"github.com/mutagen-io/mutagen/cmd"
)

func main() {
	// Set up signal handling.
	signalTermination := make(chan os.Signal, 1)
	signal.Notify(signalTermination, cmd.TerminationSignals...)

	// Wait for termination.
	<-signalTermination
}
