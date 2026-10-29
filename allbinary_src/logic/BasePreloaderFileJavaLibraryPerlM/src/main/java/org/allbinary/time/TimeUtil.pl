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

package org::allbinary::time::TimeUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::time::TimeUtil'->new();
our $calendar = 'java::util::Calendar'->getInstance();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::time::TimeUtil::instance;
}


sub setCalendar {
    my ($self, $calendar, $yearString, $monthString, $dayString, $hourString) = @_;
        my $year = int($yearString);
        my $month = int($monthString);
        my $day = int($dayString);
        my $hour = int($hourString);
        $calendar->set($year, $month, $day, $hour, 0);
}


# Java overloaded method: Perl keeps the last definition
sub setCalendar {
    my ($self, $calendar, $yearString, $monthString, $dayString, $hourString, $minuteString, $secondString) = @_;
        my $year = int($yearString);
        my $month = int($monthString);
        my $day = int($dayString);
        my $hour = int($hourString);
        my $minute = int($minuteString);
        my $second = int($secondString);
        $calendar->set($year, $month, $day, $hour, $minute, $second);
}


sub setExpirationCalendar {
    my ($self, $calendar, $yearsString, $monthsString, $daysString, $hoursString, $minutesString, $secondsString) = @_;
        my $year = $calendar->get($java::util::Calendar::YEAR) + int($yearsString);
        my $month = $calendar->get($java::util::Calendar::MONTH) + int($monthsString);
        my $day = $calendar->get($java::util::Calendar::DAY_OF_MONTH) + int($daysString);
        my $hour = $calendar->get($java::util::Calendar::HOUR) + int($hoursString);
        my $minute = $calendar->get($java::util::Calendar::MINUTE) + int($minutesString);
        my $second = $calendar->get($java::util::Calendar::SECOND) + int($secondsString);
        $calendar->set($year, $month, $day, $hour, $minute, $second);
}


sub getTotalTime {
    my ($self, $yearString, $monthString, $dayString, $hourString, $minuteString, $secondString) = @_;
        my $time = $org::allbinary::time::TimeUtil::calendar->getTimeInMillis();
        $self->setExpirationCalendar($org::allbinary::time::TimeUtil::calendar, $yearString, $monthString, $dayString, $hourString, $minuteString, $secondString);
        my $timeDelta = $org::allbinary::time::TimeUtil::calendar->getTimeInMillis();
        return $timeDelta - $time;
}

use java::util::Calendar;

1;

