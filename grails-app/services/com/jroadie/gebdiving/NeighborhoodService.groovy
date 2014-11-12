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
            neighborhood.title = container.find(".page-container #listing_name").text()
            neighborhood.address = container.find(".page-container #display-address").text()
            /* remove currency sign from price amount */
            neighborhood.price = container.find("#pricing #price_amount").text()?.substring(1)?.toDouble()
            neighborhood.paymentPeriod = container.find("#payment-period-container").text()
            container.find("#photo-modal .slideshow-preload img").each {
                neighborhood.images.add($(it).attr("src"))
            }
            /* if there is no image in modal slider (single image only) */
            if(neighborhood.images.size() == 0) {
                neighborhood.images.add(container.find("#photos img").attr("src"))
            }
            def features = container.find(".page-container .panel-body .row").getAt(1).find(".col-3").text()
        }
        return neighborhood
    }
}
