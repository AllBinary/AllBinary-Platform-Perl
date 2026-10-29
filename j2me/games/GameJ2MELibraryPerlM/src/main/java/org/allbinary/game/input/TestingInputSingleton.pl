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

package org::allbinary::game::input::TestingInputSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::AllBinaryGameLayer','org::allbinary::game::input::GameInputInterface';

our $instance = 'org::allbinary::game::input::TestingInputSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{inputProcessorArray} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
    $self->{paintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::TestingInputSingleton::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $org::allbinary::graphics::RectangleFactory::SINGLETON, 'org::allbinary::view::ViewPosition'->getInstanceD());
    $self->_init_fields();
        # super(...) made $self above
        'org::allbinary::game::input::GameInputProcessorUtil'->init($self->{inputProcessorArray});
    return $self;
}


sub initInputProcessors {
    my ($self) = @_;
}


sub initInputProcessorsForTestInput {
    my ($self, $aTestInputInterface) = @_;
        my $testInputInterface = $aTestInputInterface;
        $self->{paintable} = $testInputInterface;
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::UP] = do {
            package org::allbinary::game::input::GameInputProcessor::AnonymousN66410 { our @ISA = ('org::allbinary::game::input::GameInputProcessor');
            

            # throws Exception
            sub processEvent {
                my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
                $testInputInterface->up();
            }
            }
            'org::allbinary::game::input::GameInputProcessor::AnonymousN66410'->can('new') ? 'org::allbinary::game::input::GameInputProcessor::AnonymousN66410'->new() : bless({}, 'org::allbinary::game::input::GameInputProcessor::AnonymousN66410')
        };
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::DOWN] = do {
            package org::allbinary::game::input::GameInputProcessor::AnonymousN66558 { our @ISA = ('org::allbinary::game::input::GameInputProcessor');
            

            # throws Exception
            sub processEvent {
                my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
                $testInputInterface->down();
            }
            }
            'org::allbinary::game::input::GameInputProcessor::AnonymousN66558'->can('new') ? 'org::allbinary::game::input::GameInputProcessor::AnonymousN66558'->new() : bless({}, 'org::allbinary::game::input::GameInputProcessor::AnonymousN66558')
        };
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::LEFT] = do {
            package org::allbinary::game::input::GameInputProcessor::AnonymousN66706 { our @ISA = ('org::allbinary::game::input::GameInputProcessor');
            

            # throws Exception
            sub processEvent {
                my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
                $testInputInterface->left();
            }
            }
            'org::allbinary::game::input::GameInputProcessor::AnonymousN66706'->can('new') ? 'org::allbinary::game::input::GameInputProcessor::AnonymousN66706'->new() : bless({}, 'org::allbinary::game::input::GameInputProcessor::AnonymousN66706')
        };
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::RIGHT] = do {
            package org::allbinary::game::input::GameInputProcessor::AnonymousN66854 { our @ISA = ('org::allbinary::game::input::GameInputProcessor');
            

            # throws Exception
            sub processEvent {
                my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
                $testInputInterface->right();
            }
            }
            'org::allbinary::game::input::GameInputProcessor::AnonymousN66854'->can('new') ? 'org::allbinary::game::input::GameInputProcessor::AnonymousN66854'->new() : bless({}, 'org::allbinary::game::input::GameInputProcessor::AnonymousN66854')
        };
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM7] = do {
            package org::allbinary::game::input::GameInputProcessor::AnonymousN67002 { our @ISA = ('org::allbinary::game::input::GameInputProcessor');
            

            # throws Exception
            sub processEvent {
                my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
                $testInputInterface->strafeLeft();
            }
            }
            'org::allbinary::game::input::GameInputProcessor::AnonymousN67002'->can('new') ? 'org::allbinary::game::input::GameInputProcessor::AnonymousN67002'->new() : bless({}, 'org::allbinary::game::input::GameInputProcessor::AnonymousN67002')
        };
        $self->{inputProcessorArray}->[$javax::microedition::lcdui::Canvas::KEY_NUM9] = do {
            package org::allbinary::game::input::GameInputProcessor::AnonymousN67150 { our @ISA = ('org::allbinary::game::input::GameInputProcessor');
            

            # throws Exception
            sub processEvent {
                my ($self, $allbinaryLayerManager, $gameKeyEvent) = @_;
                $testInputInterface->strafeRight();
            }
            }
            'org::allbinary::game::input::GameInputProcessor::AnonymousN67150'->can('new') ? 'org::allbinary::game::input::GameInputProcessor::AnonymousN67150'->new() : bless({}, 'org::allbinary::game::input::GameInputProcessor::AnonymousN67150')
        };
        'org::allbinary::game::input::GameInputProcessorUtil'->init($self->{inputProcessorArray});
}


# throws Exception
sub processInputList {
    my ($self, $allbinaryLayerManager, $list) = @_;
        my $key = 0;
        my $gameKeyEvent = undef;
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            $gameKeyEvent = ($list->{objectArray}->[$index]);
            $key = $gameKeyEvent->getKey();
            $self->{inputProcessorArray}->[$key]->processEvent($allbinaryLayerManager, $org::allbinary::game::input::event::GameKeyEvent::NONE);
        }
}


# throws Exception
sub processInput {
    my ($self, $allbinaryLayerManager) = @_;
        $self->processInputList($allbinaryLayerManager, $self->getGameKeyEventList());
        $self->getGameKeyEventList()->clear();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{paintable}->paint($graphics);
}


sub implmentsGameInputInterface {
    my ($self) = @_;
        return 1;
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::view::ViewPosition;
use org::allbinary::game::input::GameInputInterface;
use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::GameInputProcessorUtil;
use org::allbinary::game::input::GameInputProcessor;

1;

