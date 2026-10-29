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

package org::allbinary::game::input::TestInputExample;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::TestInputInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{testValue} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub up {
    my ($self) = @_;
}


sub down {
    my ($self) = @_;
}


sub left {
    my ($self) = @_;
        $self->{testValue}++;
}


sub right {
    my ($self) = @_;
        $self->{testValue}--;
}


sub strafeLeft {
    my ($self) = @_;
}


sub strafeRight {
    my ($self) = @_;
}


sub paint {
    my ($self, $graphics) = @_;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::TestInputInterface;

1;

