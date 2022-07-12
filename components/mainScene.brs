sub init()
    m.button = m.top.findNode("button")
    m.noticeScreen = createObject("roSgNode", "MultystyleNotice")
    m.top.setFocus(true)

    m.button.observeField("buttonSelected", "onButtonSelectedChanged")

    initNoticeScreen()
    setInterface()
end sub

sub initNoticeScreen()
    contentFilePath = "pkg:\displayText.json"

    fileContent = ParseJson(ReadAsciiFile(contentFilePath))
    noticeTitle = fileContent.title
    noticeContent = fileContent.noticeContent

    m.noticeScreen.title = noticeTitle
    m.noticeScreen.content = noticeContent
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
    m.top.appendChild(m.noticeScreen)
    m.noticeScreen.findNode("backButton").setFocus(true)
end sub
