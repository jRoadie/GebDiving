package com.jroadie

import geb.*;

class NeighborhoodController {

    def find() {
        Browser.drive {
            go "https://www.airbnb.com/s/dhaka"

            print($("p").text())
        }
        render(view: "/index", model: [:])
    }
}
