# Generated Code Do Not Modify

package org::allbinary::time::TimeTypeUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::time::TimeTypeUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NIGHT} = "Night";
    $self->{DAY} = "Day";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::time::TimeTypeUtil::instance;
}


sub isNight {
    my ($self) = @_;
        my $hoursOfDay = $self->getHourOfDay();
        return $hoursOfDay < 6 || $hoursOfDay > 18;
}


sub getHourOfDay {
    my ($self) = @_;
        my $calendar = 'java::util::Calendar'->getInstance();
        return $calendar->get($java::util::Calendar::HOUR_OF_DAY);
}


sub getNightOrDay {
    my ($self) = @_;
        return ($self->isNight() ? $self->{NIGHT} : $self->{DAY});
}


# Java overloaded method: Perl keeps the last definition
sub getHourOfDay {
    my ($self, $timeInMillis) = @_;
        my $calendar = 'java::util::Calendar'->getInstance();
        $calendar->setTimeInMillis($timeInMillis);
        return $calendar->get($java::util::Calendar::HOUR_OF_DAY);
}


# Java overloaded method: Perl keeps the last definition
sub isNight {
    my ($self, $timeInMillis) = @_;
        my $hoursOfDay = $self->getHourOfDay($timeInMillis);
        return $hoursOfDay < 6 || $hoursOfDay > 18;
}


# Java overloaded method: Perl keeps the last definition
sub getNightOrDay {
    my ($self, $timeInMillis) = @_;
        return ($self->isNight($timeInMillis) ? $self->{NIGHT} : $self->{DAY});
}

use java::util::Calendar;
# use java::util::TimeZone;

1;

