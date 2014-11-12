package com.jroadie.gebdiving

class ApplicationTagLib {

    static namespace = "app"

    def css = { attrs, body ->
        out << "<link type='text/css' rel='stylesheet' href='${request.contextPath}/${attrs.path}'/>"
    }

    def js = { attrs, body ->
        out << "<script type='text/javascript' src='${request.contextPath}/${attrs.path}'></script>"
    }
}
