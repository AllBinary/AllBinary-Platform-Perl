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

package org::allbinary::graphics::opengles::renderer::EmulatorCustomRenderer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{renderStrings} = 'org::allbinary::graphics::opengles::renderer::RendererStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub onSurfaceCreated {
    my ($self, $gl, $eglConfig) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{renderStrings}->{ON_SURFACE_CREATED});
        my $initEmulatorFactory = 'org::allbinary::emulator::InitEmulatorFactory'->getInstance();
        if (!$initEmulatorFactory->isInitEmulator()) {
            try {
                my $WAIT_FOR_EMULATOR = "Waiting on Emulator Initialization";
                while (!$initEmulatorFactory->isInitEmulator()) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put($WAIT_FOR_EMULATOR, $self, $self->{renderStrings}->{ON_SURFACE_CREATED});
                    Time::HiRes::sleep((180) / 1000);
                }
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{renderStrings}->{ON_SURFACE_CREATED}, $e);
            }
        }
}

# use javax::microedition::khronos::egl::EGLConfig;
# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::emulator::InitEmulatorFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::graphics::opengles::renderer::RendererStrings;
use java::lang::Thread;

1;

