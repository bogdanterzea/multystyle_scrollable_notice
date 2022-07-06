sub init()
    m.button = m.top.findNode("button")
    m.top.setFocus(true)

    setInterface()

    m.button.observeField("buttonSelected", "onButtonSelectedChanged")
end sub

sub setInterface()
    m.top.backgroundURI = "pkg:/images/background.jpg"
    alignToCenter(m.button)
end sub

sub alignToCenter(component as Object)
    boundingRect = component.boundingRect()
    centerx = (1280 - boundingRect.width) / 2
    centery = (720 - boundingRect.height) / 2
    component.translation = [ centerx, centery ]
end sub

sub onButtonSelectedChanged(event as Object)
    noticeScreen = createObject("roSgNode", "MultystyleNotice")
    m.top.appendChild(noticeScreen)
    noticeScreen.setFocus(true)
end sub
