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

package org::allbinary::graphics::opengles::CurrentDisplayableFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $instance = 'org::allbinary::graphics::opengles::CurrentDisplayableFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{canvasStrings} = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{SET_DISPLAYABLE} = "setDisplayable";
    $self->{SET_RUNNABLE} = "setRunnable";
    $self->{CLEAR_RUNNABLE} = "clearRunnable";
    $self->{SET_USED_RUNNABLE} = "setUsedRunnable";
    $self->{RUNNABLE} = "Runnable: ";
    $self->{RUNNABLE_WAS_ALREADY_IN_USE} = "Runnable was already in use: ";
    $self->{DEFAULT_CHILD_NAME_LIST} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{displayable} = 'org::allbinary::game::displayable::canvas::NullDisplayable'->getInstance();
    $self->{openGlReadydisplayable} = 'org::allbinary::game::displayable::canvas::NullDisplayable'->getInstance();
    $self->{runnable} = 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance();
    $self->{usedRunnable} = 'org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::CurrentDisplayableFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{DEFAULT_CHILD_NAME_LIST}->add($self->{canvasStrings}->{ABOUT});
        $self->{DEFAULT_CHILD_NAME_LIST}->add($self->{canvasStrings}->{OPTIONS});
        $self->{DEFAULT_CHILD_NAME_LIST}->add($org::allbinary::game::displayable::canvas::GameInputMappingCanvas::NAME);
        $self->{DEFAULT_CHILD_NAME_LIST}->add($org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas::NAME);
        $self->{DEFAULT_CHILD_NAME_LIST}->add($org::allbinary::game::score::displayable::HighScoresCanvas::NAME);
    return $self;
}


sub setMyCanvas {
    my ($self, $displayable) = @_;
        if ((Scalar::Util::blessed($self->{displayable}) && $self->{displayable}->isa('org::allbinary::graphics::displayable::MyCanvas'))) {
            if ($displayable->hasChild($self->{displayable})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Child Displayable is already set for: ")->append($self->{stringUtil}->toString($displayable))->toString(), $self, $self->{SET_DISPLAYABLE});
                return;
            }
        }
        $self->setDisplayable($displayable);
}


sub setDisplayable {
    my ($self, $displayable) = @_;
        $self->{displayable} = $displayable;
        $self->setOpenGlReadydisplayable($displayable);
}


sub setOpenGlReadydisplayable {
    my ($self, $openGlReadydisplayable) = @_;
        $self->{openGlReadydisplayable} = $openGlReadydisplayable;
        $self->update();
}


sub getOpenGlReadydisplayable {
    my ($self) = @_;
        return $self->{openGlReadydisplayable};
}


sub setRunnable {
    my ($self, $runnable) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{RUNNABLE})->append($self->{stringUtil}->toString($runnable))->toString(), $self, $self->{SET_RUNNABLE});
        $self->{runnable} = $runnable;
        if ($self->{usedRunnable} != $self->{runnable}) {
            $self->update();
        } else {
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{RUNNABLE_WAS_ALREADY_IN_USE})->append($self->{stringUtil}->toString($runnable))->toString(), $self, $self->{SET_RUNNABLE});
        }
}


sub clearRunnable {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{RUNNABLE})->append($self->{stringUtil}->toString('org::allbinary::thread::NullRunnable'->getInstance()))->toString(), $self, $self->{CLEAR_RUNNABLE});
        $self->setUsedRunnable('org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance());
}


sub update {
    my ($self) = @_;
        { # synchronized ($self)
            my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
            $stringMaker->append($self->{stringUtil}->toString($self->{openGlReadydisplayable}));
            if ($org::allbinary::game::layer::SWTUtil::isSWT && !$features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringMaker->append($commonSeps->{SPACE})->append($org::allbinary::game::layer::SWTUtil::SWT)->append($commonSeps->{SPACE})->append($self->{RUNNABLE})->append($self->{stringUtil}->toString('org::allbinary::thread::NullRunnable'->getInstance()))->toString(), $self, $self->{commonStrings}->{UPDATE});
                $self->setUsedRunnable('org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance());
            } elsif ('org::allbinary::J2MEUtil'->isHTML()) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringMaker->append($commonSeps->{SPACE})->append('org::allbinary::graphics::GraphicsStrings'->getInstance()->{HTML})->append($commonSeps->{SPACE})->append($self->{RUNNABLE})->append($self->{stringUtil}->toString($self->{runnable}))->toString(), $self, $self->{commonStrings}->{UPDATE});
                $self->setUsedRunnable($self->{runnable});
            } elsif ((Scalar::Util::blessed($self->{openGlReadydisplayable}) && $self->{openGlReadydisplayable}->isa('org::allbinary::game::displayable::canvas::DemoCanvas')) || (Scalar::Util::blessed($self->{openGlReadydisplayable}) && $self->{openGlReadydisplayable}->isa('org::allbinary::game::displayable::canvas::AllBinaryGameCanvas')) || $features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringMaker->append($commonSeps->{SPACE})->append('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL}->toString())->append($commonSeps->{SPACE})->append($self->{RUNNABLE})->append($self->{stringUtil}->toString($self->{runnable}))->toString(), $self, $self->{commonStrings}->{UPDATE});
                $self->setUsedRunnable($self->{runnable});
            } else {
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringMaker->append($self->{RUNNABLE})->append($self->{stringUtil}->toString('org::allbinary::thread::NullRunnable'->getInstance()))->toString(), $self, $self->{commonStrings}->{UPDATE});
                $self->setUsedRunnable('org::allbinary::game::displayable::canvas::NullWaitGameRunnable'->getInstance());
            }
        }
}


sub getDisplayable {
    my ($self) = @_;
        return $self->{displayable};
}


sub getUsedRunnable {
    my ($self) = @_;
        return $self->{usedRunnable};
}


sub setUsedRunnable {
    my ($self, $usedRunnable) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{RUNNABLE})->append($self->{stringUtil}->toString($self->{runnable}))->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP})->append($self->{stringUtil}->toString($usedRunnable))->toString(), $self, $self->{SET_USED_RUNNABLE});
        $self->{usedRunnable} = $usedRunnable;
}

# use javax::microedition::lcdui::Displayable;
use org::allbinary::J2MEUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::displayable::canvas::DemoCanvas;
use org::allbinary::game::displayable::canvas::GameInputMappingCanvas;
use org::allbinary::game::displayable::canvas::GameInputMappingInstructionsCanvas;
use org::allbinary::game::displayable::canvas::GameRunnable;
use org::allbinary::game::displayable::canvas::NullDisplayable;
use org::allbinary::game::displayable::canvas::NullWaitGameRunnable;
use org::allbinary::game::layer::SWTUtil;
use org::allbinary::game::score::displayable::HighScoresCanvas;
use org::allbinary::graphics::GraphicsStrings;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::NullRunnable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;

1;

