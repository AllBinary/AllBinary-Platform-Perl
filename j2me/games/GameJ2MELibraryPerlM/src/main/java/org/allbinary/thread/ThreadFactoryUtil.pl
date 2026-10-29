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

package org::allbinary::thread::ThreadFactoryUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::thread::ThreadFactoryUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::thread::ThreadFactoryUtil::instance;
}


sub getInstanceGameCanvasRunnable {
    my ($self, $runnable) = @_;
        return $self->getInstanceType($runnable, $runnable->getType());
}


sub getInstanceForRunnable {
    my ($self, $runnable) = @_;
        return $self->getInstanceType($runnable, $runnable->getType());
}


sub getInstanceType {
    my ($self, $runnable, $type) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        if ('org::allbinary::J2MEUtil'->isHTML()) {
            if ($type == $org::allbinary::game::displayable::canvas::DemoCanvas::TYPE || $type == $org::allbinary::game::displayable::canvas::AllBinaryGameCanvas::TYPE) {
                my $demoGameSingleThreadStartRunnable = 'org::allbinary::game::displayable::canvas::RunnableCanvasSingleThreadStartRunnable'->new($runnable);
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Using Pseudo Thread for DemoCanvas/AllBinaryGameCanvas under PlayN/HTML5: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($runnable))->toString(), $self, $commonStrings->{CONSTRUCTOR});
                my $primaryThreadPool = 'org::allbinary::thread::PrimaryThreadPool'->getInstance();
                $primaryThreadPool->runTask($demoGameSingleThreadStartRunnable);
            } else {
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Using Pseudo Thread for Runnable under PlayN/HTML5: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($runnable))->toString(), $self, $commonStrings->{CONSTRUCTOR});
                my $primaryThreadPool = 'org::allbinary::thread::PrimaryThreadPool'->getInstance();
                $primaryThreadPool->runTask($runnable);
            }
        }
        my $thread = 'java::lang::Thread'->new($runnable, $runnable->toString());
        $self->{logUtil}->putF($thread->toString(), $self, $commonStrings->{CONSTRUCTOR});
        return $thread;
}


sub start {
    my ($self, $thread) = @_;
        $thread->start();
}

use org::allbinary::J2MEUtil;
use org::allbinary::canvas::RunnableCanvas;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::displayable::canvas::DemoCanvas;
use org::allbinary::game::displayable::canvas::GameCanvasRunnableInterface;
use org::allbinary::game::displayable::canvas::RunnableCanvasSingleThreadStartRunnable;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::PrimaryThreadPool;
use java::lang::Thread;

1;

