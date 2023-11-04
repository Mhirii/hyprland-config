package main

import (
	"encoding/json"
	"fmt"
	"os/exec"
)

type ClientData struct {
	InitialClass string `json:"InitialClass"`
}

func main() {
	cmd := exec.Command("sh", "-c", "hyprctl clients -j")
	output, err := cmd.Output()
	if err != nil {
		fmt.Println("error running command", err)
		return
	}

	var data []ClientData
	if err := json.Unmarshal(output, &data); err != nil {
		fmt.Println("error unmarshalling", err)
	}

	for _, client := range data {
		InitialClass := client.InitialClass

		switch InitialClass {
		case "kitty":
			exec.Command("sh", "-c", "hyprctl dispatch movetoworkspacesilent 2,kitty").Run()
		case "firefox":
			exec.Command("sh", "-c", "hyprctl dispatch movetoworkspacesilent 2,firefox").Run()
		case "code-oss":
			exec.Command("sh", "-c", "hyprctl dispatch movetoworkspacesilent 3,code").Run()
		}
	}
}
