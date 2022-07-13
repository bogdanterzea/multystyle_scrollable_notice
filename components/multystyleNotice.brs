sub init()
    m.NUMBER_OF_PAGES = 1
    m.CURRENT_PAGE = m.NUMBER_OF_PAGES
    m.UP_BUTTON_INDEX = 0
    m.DOWN_BUTTON_INDEX = 1
    m.BACK_BUTTON_INDEX = 2
    m.BUTTON_ON_FOCUS = m.BACK_BUTTON_INDEX

    m.navigation = m.top.findNode("navigation")
    m.contentMask = m.top.findNode("contentMask")
    m.titleContent = m.top.findNode("titleContent")
    m.noticeContent = m.top.findNode("noticeContent")

    initDrawingStyles()
    initObservers()
    initTheme()
end sub

sub initDrawingStyles()
    m.noticeContent.drawingStyles = {
        "LargeBoldRed": {
            "fontUri": "font:LargeBoldSystemFont"
            "color": "#FF0000FF"
            }
        "MediumBoldGreen": {
            "fontUri": "font:MediumBoldSystemFont"
            "color": "#00FF00FF"
        }
    }
end sub

sub initObservers()
    m.navigation.getChild(m.UP_BUTTON_INDEX).observeField("buttonSelected", "onUpButtonSelected")
    m.navigation.getChild(m.DOWN_BUTTON_INDEX).observeField("buttonSelected", "onDownButtonSelected")
    m.navigation.getChild(m.BACK_BUTTON_INDEX).observeField("buttonSelected", "onBackButtonSelected")
end sub

sub initTheme()
    m.titleContent.font = "font:LargeBoldSystemFont"
    m.titleContent.font.size = 32

    scaleContentMask()
end sub

sub scaleContentMask()
    widthIndex = 0
    heightIndex = 1

    scalingFactor = getMaskScalingFactor()
    scaledWidth = m.contentMask.maskSize[widthIndex] * scalingFactor
    scaledHeight = m.contentMask.maskSize[heightIndex] * scalingFactor

    m.contentMask.maskSize = [scaledWidth, scaledHeight]
end sub

function getMaskScalingFactor() as Float
    developmentResolutionWidth = 1280
    developmentResolutionHeight = 720

    deviceInfo = createObject("roDeviceInfo")
    deviceResolutionHeight = deviceInfo.GetUIResolution()["height"]

    scalingFactor = deviceResolutionHeight / developmentResolutionHeight

    return scalingFactor
end function

sub onUpButtonSelected()
    firstPage = 1

    if m.CURRENT_PAGE <> firstPage
        translateNoticeContentWith(544)
        m.CURRENT_PAGE -= 1
    end if
end sub

sub onDownButtonSelected()
    if m.CURRENT_PAGE <> m.NUMBER_OF_PAGES
        translateNoticeContentWith(-544)
        m.CURRENT_PAGE += 1
    end if
end sub

sub onBackButtonSelected()
    goBackTo("button")
end sub

sub translateNoticeContentWith(translationValue as Integer)
    m.noticeContent.height -= translationValue

    contentLeftBorderTranslation = m.noticeContent.translation[0]
    contentTopBorderTranslation = m.noticeContent.translation[1]

    contentTopBorderTranslation += translationValue
    m.noticeContent.translation = [contentLeftBorderTranslation, contentTopBorderTranslation]
end sub

sub onContentChange(event as Object)
    pageHeight = 536
    contentData = event.getData()
    m.noticeContent.text = contentData

    updatePagesNumber()
    updateNoticeContentHeight(pageHeight)
end sub

sub onTitleChange(event as Object)
    titleData = event.getData()
    m.titleContent.text = titleData

    allignTitle()
end sub

sub allignTitle()
    boundingRect = m.titleContent.boundingRect()
    yTranslation = 54
    xTranslation = (1280 - boundingRect.width) / 2

    m.titleContent.translation = [ xTranslation, yTranslation ]
end sub

sub updatePagesNumber()
    contentBoundingRect = m.noticeContent.boundingRect()
    exactPagesNumber = contentBoundingRect["height"]/536

    m.NUMBER_OF_PAGES = Int(exactPagesNumber)
    fractionalPart = exactPagesNumber - m.NUMBER_OF_PAGES

    if fractionalPart > 0 then m.NUMBER_OF_PAGES += 1
end sub

sub updateNoticeContentHeight(pageHeight as Integer)
    m.noticeContent.height = pageHeight
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    if press
        if key = "back"
            goBackTo("button")
        else if key = "left" and m.BUTTON_ON_FOCUS <> m.UP_BUTTON_INDEX
            navigateToLeft()
        else if key = "right" and m.BUTTON_ON_FOCUS <> m.BACK_BUTTON_INDEX
            navigateToRight()
        end if
    end if

    return true
end function

sub goBackTo(componentToFocus as String)
    parent = m.top.getparent()
    lastChild = parent.getChildCount()-1
    parent.removeChildIndex(lastChild)
    button = parent.findNode(componentToFocus)
    button.setFocus(true)
end sub

sub navigateToLeft()
    m.BUTTON_ON_FOCUS -= 1

    m.navigation.getChild(m.BUTTON_ON_FOCUS).setFocus(true)
end sub

sub navigateToRight()
    m.BUTTON_ON_FOCUS += 1

    m.navigation.getChild(m.BUTTON_ON_FOCUS).setFocus(true)
end sub
