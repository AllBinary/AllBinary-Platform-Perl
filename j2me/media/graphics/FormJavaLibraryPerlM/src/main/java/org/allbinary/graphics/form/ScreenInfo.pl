# Generated Code Do Not Modify

package org::allbinary::graphics::form::ScreenInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::form::ScreenInfo'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SMALL_WIDTH} = 320;
    $self->{SMALL_HEIGHT} = 240;
    $self->{MEDIUM_WIDTH} = 800;
    $self->{MEDIUM_HEIGHT} = 600;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::form::ScreenInfo::instance;
}


1;

