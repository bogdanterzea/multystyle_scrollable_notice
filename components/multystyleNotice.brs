sub init()
    m.BACK_BUTTON_INDEX = 2
    m.BUTTON_ON_FOCUS = m.BACK_BUTTON_INDEX

    m.title = m.top.findNode("titleContent")
    m.content = m.top.findNode("noticeContent")
    m.navigation = m.top.findNode("navigation")
    
    initObservers()
    initTheme()
end sub

sub initObservers()
    m.navigation.getChild(m.BACK_BUTTON_INDEX).observeField("buttonSelected", "onBackButtonSelected")
end sub

sub initTheme()
    m.title.font = "font:LargeBoldSystemFont"
    m.title.font.size = 32
end sub

sub onBackButtonSelected()
    goBackTo("button")
end sub

sub onContentChange(event as Object)
    contentData = event.getData()
    m.content.text = contentData
end sub

sub onTitleChange(event as Object)
    titleData = event.getData()

end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    firstButtonIndex = 0
    
    if press
        if key = "back"
            goBackTo("button")
        else if key = "left" and m.BUTTON_ON_FOCUS <> firstButtonIndex
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
