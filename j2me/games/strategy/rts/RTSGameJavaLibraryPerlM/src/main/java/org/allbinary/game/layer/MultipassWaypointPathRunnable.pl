# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::MultipassWaypointPathRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::WaypointPathRunnableBase';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
    $self->{multipassState} = 'org::allbinary::media::graphics::geography::pathfinding::MultipassState'->new();
    $self->{done} = 0;
    $self->{list} = $self->{basicArrayListUtil}->getImmutableInstance();
    $self->{pathFindingInfo} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
    $self->{FIRST_RUNNABLE} = 'org::allbinary::game::layer::FirstRunnable'->new($self);
    $self->{SECOND_RUNNABLE} = 'org::allbinary::game::layer::SecondRunnable'->new($self);
    $self->{END_RUNNABLE} = 'org::allbinary::game::layer::EndRunnable'->new($self);
    $self->{ALREADY_ENDED_RUNNABLE} = do {
        package org::allbinary::thread::ARunnable::AnonymousN66915 { our @ISA = ('org::allbinary::thread::ARunnable');
        

        sub run {
            my ($self) = @_;
            die ("RuntimeException");
        }
        }
        'org::allbinary::thread::ARunnable::AnonymousN66915'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN66915'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN66915')
    };
    $self->{currentPassRunnable} = $self->{FIRST_RUNNABLE};
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setRunning {
    my ($self, $isRunning) = @_;
        $self->{runningP} = $isRunning;
        if ($self->{runningP}) {
            $self->reset();
            $self->{done} = 0;
        }
}


sub run {
    my ($self) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            $self->{currentPassRunnable}->run();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            $self->setRunning(0);
        }
}


sub reset2 {
    my ($self) = @_;
        $self->{multipassState}->{step} = 0;
        $self->{multipassState}->{iteration} = 0;
        $self->{multipassState}->{iteration2} = 0;
        $self->{pathFindingInfo} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}


sub finish {
    my ($self) = @_;
        $self->reset2();
        $self->{currentPassRunnable} = $self->{ALREADY_ENDED_RUNNABLE};
        $self->{done} = 1;
}


sub isDone {
    my ($self) = @_;
        return $self->{done};
}


sub reset {
    my ($self) = @_;
        $self->reset2();
        $self->{currentPassRunnable} = $self->{FIRST_RUNNABLE};
        $self->{done} = 0;
}


sub processFirstRunnable {
    my ($self) = @_;
        try {
            $self->{pathFindingLayer}->getWaypointRunnableLogHelper()->start($self->{pathFindingLayer});
            $self->reset2();
            my $geographicMapCellPosition = $self->{pathFindingLayer}->getCurrentGeographicMapCellPosition();
            if (!defined($geographicMapCellPosition)) {
                die ("Should never be running here");
            }
            $self->{pathFindingInfo} = $self->{targetPathFindingLayer}->getWaypointBehavior()->getWaypoint()->getPathFindingInfo($geographicMapCellPosition);
            my $localPathFindingInfo = $self->{pathFindingInfo};
            $self->{list} = $self->{targetPathFindingLayer}->getWaypointBehavior()->getWaypoint()->getPathsList($geographicMapCellPosition, $localPathFindingInfo, $self->{multipassState});
            if ($self->{list} != $self->{basicArrayListUtil}->getImmutableInstance()) {
                $self->{END_RUNNABLE}->run();
            } else {
                $self->{currentPassRunnable} = $self->{SECOND_RUNNABLE};
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            $self->setRunning(0);
            $self->finish();
        }
}


sub processSecondRunnable {
    my ($self) = @_;
        try {
            my $geographicMapCellPosition = $self->{pathFindingLayer}->getCurrentGeographicMapCellPosition();
            my $localPathFindingInfo = $self->{pathFindingInfo};
            $self->{list} = $self->{targetPathFindingLayer}->getWaypointBehavior()->getWaypoint()->getPathsList($geographicMapCellPosition, $localPathFindingInfo, $self->{multipassState});
            if ($self->{list} != $self->{basicArrayListUtil}->getImmutableInstance()) {
                $self->{END_RUNNABLE}->run();
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            $self->setRunning(0);
            $self->finish();
        }
}


sub processEndRunnable {
    my ($self) = @_;
        try {
            my $waypointBehavior = $self->{pathFindingLayer}->getWaypointBehavior();
            $waypointBehavior->setWaypointPathsList($self->{list});
            $self->{pathFindingLayer}->getWaypointRunnableLogHelper()->end($self->{pathFindingLayer});
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
            $self->setRunning(0);
        }
        $self->finish();
}
{
    package org::allbinary::game::layer::FirstRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::thread::ARunnable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{multipassWaypointPathRunnable} = undef;
    }
    

    sub new {
        my ($class, $multipassWaypointPathRunnable) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{multipassWaypointPathRunnable} = $multipassWaypointPathRunnable;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            $self->{multipassWaypointPathRunnable}->processFirstRunnable();
    }
    }

{
    #    private boolean first = true;
    package org::allbinary::game::layer::SecondRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::thread::ARunnable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{multipassWaypointPathRunnable} = undef;
    }
    

    sub new {
        my ($class, $multipassWaypointPathRunnable) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{multipassWaypointPathRunnable} = $multipassWaypointPathRunnable;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            $self->{multipassWaypointPathRunnable}->processSecondRunnable();
    }
    }

{
    package org::allbinary::game::layer::EndRunnable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::thread::ARunnable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{multipassWaypointPathRunnable} = undef;
    }
    

    sub new {
        my ($class, $multipassWaypointPathRunnable) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{multipassWaypointPathRunnable} = $multipassWaypointPathRunnable;
        return $self;
    }
    

    sub run {
        my ($self) = @_;
            $self->{multipassWaypointPathRunnable}->processEndRunnable();
    }
    }


use org::allbinary::logic::NullUtil;
use org::allbinary::thread::ARunnable;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::pathfinding::MultipassState;
use org::allbinary::media::graphics::geography::pathfinding::PathFindingInfo;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::layer::WaypointPathRunnableBase;

1;

