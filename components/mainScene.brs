sub init()
    m.top.backgroundURI = "pkg:/images/background.jpg"

    button = m.top.findNode("button")
    alignToCenter(button)

    m.top.setFocus(true)
end sub

sub alignToCenter(component as Object)
    boundingRect = component.boundingRect()
    centerx = (1280 - boundingRect.width) / 2
    centery = (720 - boundingRect.height) / 2
    component.translation = [ centerx, centery ]
end sub