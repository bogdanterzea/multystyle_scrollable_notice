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
    loremIpsum = " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et nibh sed eros sodales volutpat. Aliquam maximus laoreet vestibulum. Fusce pulvinar, nisl vel dictum ullamcorper, lacus elit cursus sapien, eget vestibulum elit tellus in nisl. Donec libero libero, pellentesque vel sagittis vitae, venenatis et lorem. Vestibulum eu sapien elit. Vivamus eu diam felis. Vivamus ac ipsum eget sem lobortis dapibus ac at turpis. Nam ultrices dolor vel dolor eleifend, eget interdum tellus egestas. Nunc interdum, orci et tempor vehicula, metus ante sodales tortor, vitae fringilla nisl dolor non risus. Duis bibendum nisi a tortor posuere cursus. Morbi vitae felis elit. Cras nulla odio, ullamcorper in porttitor et, lacinia et dolor. Nunc mollis malesuada magna ut semper. Vestibulum ullamcorper elit blandit vestibulum rhoncus. Suspendisse potenti.Donec nec arcu felis. Morbi at finibus urna. Donec commodo a enim in molestie. Curabitur eu metus interdum mi tincidunt porta. Aenean at diam nisi. Phasellus id lobortis ex, quis porttitor tortor. Praesent quis consectetur urna. Ut lacus sapien, fermentum in sodales sed, scelerisque sed libero. Donec dapibus maximus leo. Pellentesque finibus lacus a velit pellentesque, sed sagittis nisl rutrum. Donec velit purus, imperdiet nec vestibulum ac, venenatis et est. In imperdiet sit amet nisl et lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et nibh sed eros sodales volutpat. Aliquam maximus laoreet vestibulum. Fusce pulvinar, nisl vel dictum ullamcorper, lacus elit cursus sapien, eget vestibulum elit tellus in nisl. Donec libero libero, pellentesque vel sagittis vitae, venenatis et lorem. Vestibulum eu sapien elit. Vivamus eu diam felis. Vivamus ac ipsum eget sem lobortis dapibus ac at turpis. Nam ultrices dolor vel dolor eleifend, eget interdum tellus egestas. Nunc interdum, orci et tempor vehicula, metus ante sodales tortor, vitae fringilla nisl dolor non risus. Duis bibendum nisi a tortor posuere cursus. Morbi vitae felis elit. Cras nulla odio, ullamcorper in porttitor et, lacinia et dolor. Nunc mollis malesuada magna ut semper. Vestibulum ullamcorper elit blandit vestibulum rhoncus. Suspendisse potenti.Donec nec arcu felis. Morbi at finibus urna. Donec commodo a enim in molestie. Curabitur eu metus interdum mi tincidunt porta. Aenean at diam nisi. Phasellus id lobortis ex, quis porttitor tortor. Praesent quis consectetur urna. Ut lacus sapien, fermentum in sodales sed, scelerisque sed libero. Donec dapibus maximus leo. Pellentesque finibus lacus a velit pellentesque, sed sagittis nisl rutrum. Donec velit purus, imperdiet nec vestibulum ac, venenatis et est. In imperdiet sit amet nisl et lacinia.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et nibh sed eros sodales volutpat. Aliquam maximus laoreet vestibulum. Fusce pulvinar, nisl vel dictum ullamcorper, lacus elit cursus sapien, eget vestibulum elit tellus in nisl. Donec libero libero, pellentesque vel sagittis vitae, venenatis et lorem. Vestibulum eu sapien elit. Vivamus eu diam felis. Vivamus ac ipsum eget sem lobortis dapibus ac at turpis. Nam ultrices dolor vel dolor eleifend, eget interdum tellus egestas. Nunc interdum, orci et tempor vehicula, metus ante sodales tortor, vitae fringilla nisl dolor non risus. Duis bibendum nisi a tortor posuere cursus. Morbi vitae felis elit. Cras nulla odio, ullamcorper in porttitor et, lacinia et dolor. Nunc mollis malesuada magna ut semper. Vestibulum ullamcorper elit blandit vestibulum rhoncus. Suspendisse potenti.Donec nec arcu felis. Morbi at finibus urna. Donec commodo a enim in molestie. Curabitur eu metus interdum mi tincidunt porta. Aenean at diam nisi. Phasellus id lobortis ex, quis porttitor tortor. Praesent quis consectetur urna. Ut lacus sapien, fermentum in sodales sed, scelerisque sed libero. Donec dapibus maximus leo. Pellentesque finibus lacus a velit pellentesque, sed sagittis nisl rutrum. Donec velit purus, imperdiet nec vestibulum ac, venenatis et est. In imperdiet sit amet nisl et lacinia."
    noticeScreen.content = loremIpsum
    m.top.appendChild(noticeScreen)
    noticeScreen.setFocus(true)
end sub
