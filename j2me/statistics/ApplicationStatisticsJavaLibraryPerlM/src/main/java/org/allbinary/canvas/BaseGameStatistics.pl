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

package org::allbinary::canvas::BaseGameStatistics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();


sub _init_fields {
    my ($self) = @_;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(2147483647);
    $self->{updateDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(2000);
    $self->{totalRefreshes} = 0;
    $self->{totalFrames} = 0;
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
    $self->{DEFAULT_SCALE_FACTOR} = 'org::allbinary::logic::math::ScaleFactorFactory'->getInstance()->{DEFAULT_SCALE_FACTOR};
    $self->{NOT} = "Not enough Time to Calculate";
    $self->{EMPTY_STRING} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{STRING_ARRAY} = [" Total Time: ", $self->{EMPTY_STRING}, " Total Frames: ", $self->{EMPTY_STRING}, " Frames/10 Sec: ", $self->{EMPTY_STRING}, " Total Paints: ", $self->{EMPTY_STRING}, " Paints/10 Sec: ", $self->{EMPTY_STRING}];
    $self->{SPACE_CHAR} = " ";
    $self->{PLUS_CHAR} = "+";
    $self->{X_CHAR} = "X";
    $self->{CHAR_ARRAY} = [["F", "r", "a", "m", "e", "s", "/", "1", "0", " ", "S", "e", "c", ":"], ["X", "X"], ["P", "a", "i", "n", "t", "s", "/", "1", "0", " ", "S", "e", "c", ":"], ["X", "X"]];
    $self->{primitiveLongSingleton} = 'org::allbinary::logic::math::PrimitiveLongSingleton'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{timeDelayHelper}->setStartTimeTNT();
        $self->{totalRefreshes} = 0;
        $self->{totalFrames} = 0;
}


sub add {
    my ($self, $string) = @_;
}


sub process {
    my ($self) = @_;
}


sub nextFrame {
    my ($self) = @_;
        $self->{totalFrames}++;
}


sub nextRefresh {
    my ($self) = @_;
        $self->{totalRefreshes}++;
}


sub getRefreshRate {
    my ($self) = @_;
        my $elapsed = $self->{timeDelayHelper}->getElapsed($self->{gameTickTimeDelayHelper}->{startTime});
        if ($elapsed > 1) {
            my $time = ((int((int($self->{totalRefreshes} / (POSIX::floor(($elapsed) / (2 ** ($self->{DEFAULT_SCALE_FACTOR}))))))) + 32768) % 65536 - 32768);
            return $time;
        } else {
            return 0;
        }
}


sub getTimeDelayHelper {
    my ($self) = @_;
        return $self->{timeDelayHelper};
}


sub to2DCharArray {
    my ($self) = @_;
        my $totalTime = $self->{timeDelayHelper}->getElapsed($self->{gameTickTimeDelayHelper}->{startTime});
        $totalTime = (POSIX::floor(($totalTime) / (2 ** ($self->{DEFAULT_SCALE_FACTOR}))));
        if ($totalTime > 0 && $self->{updateDelayHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            my $framesPerSec = (int($self->{totalFrames} / $totalTime));
            if ($framesPerSec < 10) {
                $self->{CHAR_ARRAY}->[1]->[0] = $self->{SPACE_CHAR};
                $self->{CHAR_ARRAY}->[1]->[1] = $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAY}->[$framesPerSec];
            } elsif ($framesPerSec < 100) {
                my $tens = int($framesPerSec / 10);
                my $removeTens = $tens * 10;
                $self->{CHAR_ARRAY}->[1]->[0] = $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAY}->[$tens];
                $self->{CHAR_ARRAY}->[1]->[1] = $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAY}->[$framesPerSec - $removeTens];
            } else {
                $self->{CHAR_ARRAY}->[1]->[0] = $self->{PLUS_CHAR};
                $self->{CHAR_ARRAY}->[1]->[1] = $self->{PLUS_CHAR};
            }
            my $refreshesPerSec = (int($self->{totalRefreshes} / $totalTime));
            if ($refreshesPerSec < 10) {
                $self->{CHAR_ARRAY}->[3]->[0] = $self->{X_CHAR};
                $self->{CHAR_ARRAY}->[3]->[1] = $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAY}->[$refreshesPerSec];
            } elsif ($refreshesPerSec < 100) {
                my $tens = int($refreshesPerSec / 10);
                my $removeTens = $tens * 10;
                $self->{CHAR_ARRAY}->[3]->[0] = $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAY}->[int($refreshesPerSec / 10)];
                $self->{CHAR_ARRAY}->[3]->[1] = $self->{primitiveLongSingleton}->{NUMBER_CHAR_ARRAY}->[$refreshesPerSec - $removeTens];
            } else {
                $self->{CHAR_ARRAY}->[3]->[0] = $self->{PLUS_CHAR};
                $self->{CHAR_ARRAY}->[3]->[1] = $self->{PLUS_CHAR};
            }
        }
        return $self->{CHAR_ARRAY};
}


sub toStringArray {
    my ($self) = @_;
        my $totalTime = $self->{timeDelayHelper}->getElapsed($self->{gameTickTimeDelayHelper}->{startTime});
        $totalTime = (int($totalTime / 10000));
        if ($totalTime > 0) {
            $self->{STRING_ARRAY}->[1] = ("" . ($totalTime));
            $self->{STRING_ARRAY}->[3] = ("" . ($self->{totalFrames}));
            $self->{STRING_ARRAY}->[5] = ("" . (int($self->{totalFrames} / $totalTime)));
            $self->{STRING_ARRAY}->[7] = ("" . ($self->{totalRefreshes}));
            $self->{STRING_ARRAY}->[9] = ("" . (int($self->{totalRefreshes} / $totalTime)));
        } else {
            my $string = $self->{EMPTY_STRING};
            $self->{STRING_ARRAY}->[1] = $string;
            $self->{STRING_ARRAY}->[3] = $string;
            $self->{STRING_ARRAY}->[5] = $string;
            $self->{STRING_ARRAY}->[7] = $string;
            $self->{STRING_ARRAY}->[9] = $string;
        }
        return $self->{STRING_ARRAY};
}


sub toStringAt {
    my ($self, $totalTime) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{STRING_ARRAY}->[0]);
        $stringBuffer->appendlong($totalTime);
        $stringBuffer->append($self->{STRING_ARRAY}->[2]);
        $stringBuffer->appendlong($self->{totalFrames});
        $stringBuffer->append($self->{STRING_ARRAY}->[4]);
        $stringBuffer->appendlong(int($self->{totalFrames} / $totalTime));
        if ($self->{totalRefreshes} > 0) {
            $stringBuffer->append($self->{STRING_ARRAY}->[6]);
            $stringBuffer->appendlong($self->{totalRefreshes});
            $stringBuffer->append($self->{STRING_ARRAY}->[8]);
            $stringBuffer->appendlong(int($self->{totalRefreshes} / $totalTime));
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        }
        return $stringBuffer->toString();
}


sub toString {
    my ($self) = @_;
        my $totalTime = $self->{timeDelayHelper}->getElapsed($self->{gameTickTimeDelayHelper}->{startTime});
        $totalTime = (int($totalTime / 1000));
        if ($totalTime > 0) {
            return $self->toStringAt($totalTime);
        } else {
            return $self->{NOT};
        }
}

use org::allbinary::logic::math::PrimitiveLongSingleton;
use org::allbinary::logic::math::ScaleFactorFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;

1;

