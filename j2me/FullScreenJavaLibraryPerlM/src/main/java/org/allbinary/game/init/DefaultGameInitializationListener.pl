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

package org::allbinary::game::init::DefaultGameInitializationListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::game::configuration::event::GameInitializedListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{swtJOGLProcessor} = 'org::allbinary::graphics::threed::SWTJOGLProcessor'->getInstance();
    $self->{firstTime} = 1;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $gameInitializedEventHandler = 'org::allbinary::game::configuration::event::GameInitializedEventHandler'->getInstance();
        $gameInitializedEventHandler->removeAllListeners();
        $gameInitializedEventHandler->addListenerInterface($self);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onGameInitialized {
    my ($self, $gameInitializedEvent) = @_;
        my $ON_GAME_INITIALIZED = "onGameInitialized";
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            $self->{logUtil}->putF($commonStrings->{START}, $self, $ON_GAME_INITIALIZED);
            while (!$self->{swtJOGLProcessor}->isHolderCreated()) {
                $self->{logUtil}->putF($commonStrings->{UPDATE}, $self, $ON_GAME_INITIALIZED);
                Time::HiRes::sleep((20) / 1000);
            }
            'org::allbinary::game::resource::FeatureResourceInitializationUtil'->getInstance()->init($gameInitializedEvent->getLevel());
            if ($self->{firstTime}) {
                $self->{firstTime} = 0;
            } else {
                $self->{swtJOGLProcessor}->onSurfaceChanged();
            }
        } catch ($e) {
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $ON_GAME_INITIALIZED, $e);
        }
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::configuration::event::GameInitializedEvent;
use org::allbinary::game::configuration::event::GameInitializedEventHandler;
use org::allbinary::game::configuration::event::GameInitializedListenerInterface;
use org::allbinary::game::resource::FeatureResourceInitializationUtil;
use org::allbinary::graphics::threed::SWTJOGLProcessor;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use java::lang::Thread;

1;

