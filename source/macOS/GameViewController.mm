//
//  GameViewController.m
//  Metal ray-tracer
//
//  Created by Sergey Reznik on 9/15/18.
//  Copyright © 2018 Serhii Rieznik. All rights reserved.
//

#import <MetalKit/MetalKit.h>
#import "GameViewController.h"
#import "Renderer.h"

@implementation GameViewController
{
    MTKView* _view;
    Renderer* _renderer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _view = (MTKView*)self.view;
    _view.layer.contentsScale = [[NSScreen mainScreen] backingScaleFactor];
    _view.device = MTLCreateSystemDefaultDevice();
    _view.depthStencilPixelFormat = MTLPixelFormatInvalid;
    _view.colorPixelFormat = MTLPixelFormatBGRA8Unorm;

    if (_view.device == nil)
    {
        NSLog(@"Metal is not supported on this device");
        self.view = [[NSView alloc] initWithFrame:self.view.frame];
        return;
    }

    _renderer = [[Renderer alloc] initWithMetalKitView:_view];
    [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];
    _view.delegate = _renderer;
}

@end
