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

package org::allbinary::media::audio::Sounds;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{soundStrings} = 'org::allbinary::media::audio::SoundStrings'->getInstance();
    $self->{soundsFactoryInterface} = undef;
}


sub new {
    my ($class, $soundsFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{soundsFactoryInterface} = $soundsFactoryInterface;
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{INIT});
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $self->{soundsFactoryInterface}->init();
        my $soundInterfaceArray = $self->{soundsFactoryInterface}->getSoundInterfaceArray();
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        my $indexInteger = undef;
        my $indexString = undef;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $i = 0; $i < scalar(@{$soundInterfaceArray}); $i++) {
            my $soundInterface = $soundInterfaceArray->[$i];
            if (defined($soundInterface)) {
                $indexInteger = $smallIntegerSingletonFactory->getAt($i);
                $indexString = ("" . ($indexInteger));
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($commonLabels->{INDEX_LABEL});
                $stringBuffer->append($indexString);
                $stringBuffer->append($self->{soundStrings}->{SOUND});
                $stringBuffer->append(ref($soundInterface));
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{INIT});
                $soundInterface->init();
                $progressCanvas->addNormalPortion(100, 'org::allbinary::logic::string::StringMaker'->new()->append($self->{soundStrings}->{INIT_SOUND})->append($indexString)->toString());
            }
        }
        $self->{soundsFactoryInterface}->setInitialized(1);
        $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{INIT});
}


# throws Exception
sub stopAll {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{soundStrings}->{STOP_ALL});
        my $soundInterfaceArray = $self->{soundsFactoryInterface}->getSoundInterfaceArray();
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        my $player = undef;
        for (my $index = 0; $index < scalar(@{$soundInterfaceArray}); $index++) {
            if (defined($soundInterfaceArray->[$index])) {
                $player = $soundInterfaceArray->[$index]->getPlayerP();
                if (defined($player)) {
                    $player->stop();
                    $progressCanvas->addPortion(100, $self->{soundStrings}->{STOPPING_SOUND}, $index);
                }
            }
        }
}


# throws Exception
sub closeAll {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{soundStrings}->{CLOSE_ALL});
        my $soundInterfaceArray = $self->{soundsFactoryInterface}->getSoundInterfaceArray();
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        my $player = undef;
        for (my $index = 0; $index < scalar(@{$soundInterfaceArray}); $index++) {
            if (defined($soundInterfaceArray->[$index])) {
                $player = $soundInterfaceArray->[$index]->getPlayerP();
                if (defined($player)) {
                    $player->close();
                    $progressCanvas->addPortion(100, $self->{soundStrings}->{CLOSING_SOUND}, $index);
                }
            }
        }
}

# use javax::microedition::media::Player;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::string::CommonLabels;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::media::audio::SoundStrings;

1;

