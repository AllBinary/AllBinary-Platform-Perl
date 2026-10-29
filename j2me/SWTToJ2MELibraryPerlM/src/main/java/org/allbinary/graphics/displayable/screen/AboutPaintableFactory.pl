#
# AllBinary Open License Version 1
# Copyright (c) 2022 AllBinary
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

package org::allbinary::graphics::displayable::screen::AboutPaintableFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::screen::AboutPaintableFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{paintableArray} = ['org::allbinary::graphics::paint::NullPaintable'->getInstance()];
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::screen::AboutPaintableFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $INFO = ["Built with the", "AllBinary Platform", 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, "Comments or Questions:", "support\@allbinary.com"];
        my $DEVELOPERS = ["Developed By:", "Travis Berthelot"];
        $self->{paintableArray} = 'org::allbinary::game::paint::AboutPaintable'->getInstance($INFO, $DEVELOPERS)->getPaintableArrayInstance();
    return $self;
}

use org::allbinary::game::paint::AboutPaintable;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::string::StringUtil;

1;

