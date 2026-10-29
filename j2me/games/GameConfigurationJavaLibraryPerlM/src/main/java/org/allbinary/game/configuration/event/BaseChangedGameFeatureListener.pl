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

package org::allbinary::game::configuration::event::BaseChangedGameFeatureListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::configuration::event::GameFeatureListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameFeatureUtil} = 'org::allbinary::game::configuration::feature::GameFeatureUtil'->getInstance();
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{changed} = 1;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED}, $self);
}


sub onGameFeatureChange {
    my ($self, $gameFeatureEvent) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{gameFeatureUtil}->{GAME_FEATURE_CHANGED})->append($gameFeatureEvent->getWhatChanged())->toString(), $self, $self->{gameFeatureUtil}->{ON_GAME_FEATURE_CHANGE});
        $self->{list}->add($gameFeatureEvent->getGameOption());
        $self->setChanged(1);
}


sub add {
    my ($self, $gameFeature) = @_;
        $self->{list}->add($gameFeature);
}


sub remove {
    my ($self, $gameFeature) = @_;
        $self->{list}->remove($gameFeature);
}


sub setChanged {
    my ($self, $initialized) = @_;
        $self->{changed} = $initialized;
        if (!$self->isChanged()) {
            $self->{list}->clear();
        }
}


sub isChangedFeature {
    my ($self, $gameFeature) = @_;
        my $isChanged = $self->{list}->contains($gameFeature);
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("GameFeature: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($gameFeature));
        $stringBuffer->append(" isFeature: ");
        $stringBuffer->appendboolean('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature($gameFeature));
        $stringBuffer->append(" isChanged: ");
        $stringBuffer->appendboolean($isChanged);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "isChanged");
        return $isChanged;
}


sub isChanged {
    my ($self) = @_;
        return $self->{changed};
}

use org::allbinary::game::configuration::feature::Feature;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::configuration::event::GameFeatureListenerInterface;

1;

