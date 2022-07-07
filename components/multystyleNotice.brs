sub init()
    m.BUTTON_ON_FOCUS = 2

    m.navigation = m.top.findNode("navigation")
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    firstButton = 0
    lastButton = 2

    if press
        if(key = "back")
            goBackTo("button")
        end if
        if key = "left"
            if m.BUTTON_ON_FOCUS <> firstButton then navigateToLeft()
        end if
        if key = "right"
            if m.BUTTON_ON_FOCUS <> lastButton then navigateToRight()
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
