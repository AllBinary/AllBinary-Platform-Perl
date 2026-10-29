# Generated Code Do Not Modify

package org::allbinary::game::BasicGameInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::BasicGameInfoFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{currentReleaseIndex} = 0;
    $self->{currentDestroyIndex} = 0;
    $self->{total} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::BasicGameInfoFactory::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self, $total) = @_;
        $self->{currentReleaseIndex} = 0;
        $self->{currentDestroyIndex} = 0;
        $self->{total} = $total;
}


sub isPeaked {
    my ($self) = @_;
        if ($self->{currentDestroyIndex} >= $self->{total}) {
            return 1;
        } else {
            return 0;
        }
}


sub howManyLeft {
    my ($self) = @_;
        return $self->{total} - $self->{currentDestroyIndex};
}


1;

