package com.jroadie.gebdiving

import com.jroadie.gebdiving.model.NeighborhoodModel
import geb.Browser
import geb.navigator.Navigator
import grails.transaction.Transactional

@Transactional
class NeighborhoodService {

    private static airbnb_url = "https://www.airbnb.com";

    public List<NeighborhoodModel> listOfNeighborhoods(String searchPage) {
        List<NeighborhoodModel> neighborhoods = []
        Browser.drive {
            go(airbnb_url + searchPage)

            /* list the details page link of neighborhood of this search page */
            List<String> detailPages = []
            $('a.media-cover').each {
                detailPages.add($(it).attr("href"))
            }

            /* parse all neighborhoods from their details page */
            detailPages.each { detailPageLink ->
                neighborhoods.add(parseNeighborhoodInfo(detailPageLink))
            }

            /* recursively list all neighborhoods if the next search page exists */
            String nextPage = $(".pagination li.next_page a").attr("href")
            if(nextPage) {
                return neighborhoods.addAll(listOfNeighborhoods(nextPage))
            }
        }
        return neighborhoods
    }

    public NeighborhoodModel parseNeighborhoodInfo(String detailsPage) {
        NeighborhoodModel neighborhood = new NeighborhoodModel()
        Browser.drive {
            go(detailsPage)
            Navigator container = $("#room")
            container.find("#photo-modal li.media-photo img").each {
                neighborhood.images.add($(it).attr("src"))
            }
        }
        return neighborhood
    }
}
