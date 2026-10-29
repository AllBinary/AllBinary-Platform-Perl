#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::game::displayable::canvas::DemoCanvasProgressUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub showProgress {
    my ($class, $demoCanvas) = @_;
        'org::allbinary::game::displayable::canvas::DemoCanvasProgressUtil'->showProgressOptionallyInTheBackground($demoCanvas, 0);
}


sub showProgressOptionallyInTheBackground {
    my ($class, $demoCanvas, $background) = @_;
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->startBackground($background);
        my $paintableArray = [(undef) x (2)];
        $paintableArray->[0] = $progressCanvas;
        $paintableArray->[1] = $demoCanvas->getDefaultPaintableInterface();
        $demoCanvas->setDefaultPaintableInterface('org::allbinary::graphics::paint::PaintableComposite'->new($paintableArray));
        $demoCanvas->setPaintableInterface($demoCanvas->getDefaultPaintableInterface());
}

use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::graphics::paint::PaintableComposite;
use org::allbinary::graphics::paint::PaintableInterface;

1;

