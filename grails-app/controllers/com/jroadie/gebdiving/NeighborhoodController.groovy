package com.jroadie.gebdiving

import com.jroadie.gebdiving.model.NeighborhoodModel
import geb.*;

class NeighborhoodController {

    NeighborhoodService neighborhoodService

    def find() {
        List<NeighborhoodModel> neighborhoods = neighborhoodService.listOfNeighborhoods("/s/" + params.location)
        println(neighborhoods)

        //$('.pagination').find('a[rel=next]')
        render(view: "/index", model: [:])
    }
}
