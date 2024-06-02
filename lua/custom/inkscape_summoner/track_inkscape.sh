#!/bin/bash
#wait until we detect inkscape is not running
while (ps -ax | grep overlay.svg | grep -v grep) do
   sleep 1
done
