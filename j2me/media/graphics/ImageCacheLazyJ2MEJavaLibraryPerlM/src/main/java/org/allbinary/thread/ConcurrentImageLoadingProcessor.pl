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

package org::allbinary::thread::ConcurrentImageLoadingProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::BaseImageLoadingProcessor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{runnable} = undef;
}


sub new {
    my ($class, $imageCache) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{runnable} = 'org::allbinary::thread::ImageCacheRunnable'->new($imageCache);
    return $self;
}


sub runTask {
    my ($self) = @_;
        if (!$self->{runnable}->isRunning()) {
            'org::allbinary::thread::ImageThreadPool'->getInstance()->runTask($self->{runnable});
        }
}
{
    package org::allbinary::thread::ImageCacheRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::thread::ABRunnable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{imageCache} = undef;
    }
    

    sub new {
        my ($class, $imageCache) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{imageCache} = $imageCache;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            try {
                $self->setRunning(1);
                $self->{imageCache}->waitForLoadNow();
                $self->{imageCache}->loadImages();
                $self->{imageCache}->loadRemainingAnimations();
                $self->setRunning(0);
                my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
                if (!$progressCanvas->{inProgress}) {
                    $progressCanvas->endFromInitialLazyLoadingComplete();
                }
            } catch ($e) {
                $self->setRunning(0);
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            }
    }
    }


use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::image::ImageCache;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::BaseImageLoadingProcessor;
use org::allbinary::thread::ABRunnable;
use org::allbinary::thread::ImageThreadPool;

1;

