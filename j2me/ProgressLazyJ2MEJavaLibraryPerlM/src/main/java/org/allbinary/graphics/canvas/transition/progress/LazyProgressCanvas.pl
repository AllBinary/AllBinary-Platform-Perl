# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::graphics::canvas::transition::progress::LazyProgressCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::canvas::transition::progress::ProgressCanvas';



sub new {
    my ($class, $title, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $backgroundBasicColor, $foregroundBasicColor);
        # super(...) made $self above
    return $self;
}


sub start {
    my ($self) = @_;
        $self->SUPER::start();
        $self->{hasPainted} = 0;
}


sub end {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{END_METHOD_NAME});
            $self->endActual();
            $self->{paintable} = $self->{GAUGE_PAINTABLE};
            'org::allbinary::image::ImageCacheFactory'->getInstance()->runTask();
            'org::allbinary::image::ImageCacheFactory'->getInstance()->progressEnded();
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{END_METHOD_NAME});
        }
}


sub inGame {
    my ($self) = @_;
        $self->{inGameProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
}


sub endFromInitialLazyLoadingComplete {
    my ($self) = @_;
        $self->SUPER::endFromInitialLazyLoadingComplete();
        $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}


sub endIfPaintedSinceStart {
    my ($self) = @_;
        if ($self->{paintable} == $self->{GAUGE_PAINTABLE} && $self->{hasPainted}) {
            $self->endFromInitialLazyLoadingComplete();
        }
}

use org::allbinary::canvas::Processor;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;

1;

