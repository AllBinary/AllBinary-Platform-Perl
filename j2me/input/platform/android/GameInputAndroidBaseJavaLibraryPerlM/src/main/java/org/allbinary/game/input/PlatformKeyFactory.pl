# Generated Code Do Not Modify

package org::allbinary::game::input::PlatformKeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{androidKeyFactory} = 'org::allbinary::game::input::ActivityFractureControllerUtilFactory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::PlatformKeyFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::PlatformKeyFactory::instance = 'org::allbinary::game::input::PlatformKeyFactory'->new();
        }
        return $org::allbinary::game::input::PlatformKeyFactory::instance;
}


sub getString {
    my ($self, $keyCode) = @_;
        return 'org::allbinary::game::input::AndroidGameKey'->getString($keyCode);
}


sub isSubmission {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isSubmission($input);
}


sub isDelete {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isDelete($input);
}


sub isBackSpace {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isBackSpace($input);
}


sub isLeft {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isLeft($input);
}


sub isRight {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isRight($input);
}


sub isUp {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isUp($input);
}


sub isDown {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isDown($input);
}


sub isEnter {
    my ($self, $input) = @_;
        return $self->{androidKeyFactory}->isEnter($input);
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::input::ActivityFractureControllerUtilFactory;
use org::allbinary::game::input::AndroidGameKey;

1;

