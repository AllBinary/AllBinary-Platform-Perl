# Generated Code Do Not Modify

package org::allbinary::time::TimeTypeUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::time::TimeTypeUtil'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{NIGHT} = "Night";
    $self->{DAY} = "Day";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::time::TimeTypeUtil::instance;
}


sub isNight_j0 {
    my ($self) = @_;
        my $hoursOfDay = $self->getHourOfDay();
        return $hoursOfDay < 6 || $hoursOfDay > 18;
}


sub getHourOfDay_j0 {
    my ($self) = @_;
        my $calendar = 'java::util::Calendar'->getInstance();
        return $calendar->get($java::util::Calendar::HOUR_OF_DAY);
}


sub getNightOrDay_j0 {
    my ($self) = @_;
        return ($self->isNight() ? $self->{NIGHT} : $self->{DAY});
}


sub getHourOfDay_j1 {
    my ($self, $timeInMillis) = @_;
        my $calendar = 'java::util::Calendar'->getInstance();
        $calendar->setTimeInMillis($timeInMillis);
        return $calendar->get($java::util::Calendar::HOUR_OF_DAY);
}

sub getHourOfDay {
    my ($invocant, @arguments) = @_;
    return $invocant->getHourOfDay_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getHourOfDay_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getHourOfDay takes " . scalar(@arguments) . " arguments";
}


sub isNight_j1 {
    my ($self, $timeInMillis) = @_;
        my $hoursOfDay = $self->getHourOfDay($timeInMillis);
        return $hoursOfDay < 6 || $hoursOfDay > 18;
}

sub isNight {
    my ($invocant, @arguments) = @_;
    return $invocant->isNight_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->isNight_j1(@arguments) if scalar(@arguments) == 1;
    die "No method isNight takes " . scalar(@arguments) . " arguments";
}


sub getNightOrDay_j1 {
    my ($self, $timeInMillis) = @_;
        return ($self->isNight($timeInMillis) ? $self->{NIGHT} : $self->{DAY});
}

sub getNightOrDay {
    my ($invocant, @arguments) = @_;
    return $invocant->getNightOrDay_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getNightOrDay_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getNightOrDay takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::util::Calendar ();
# use java::util::TimeZone ();

1;

