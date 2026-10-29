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

package org::allbinary::graphics::draw::KeyValueDrawString;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{LABEL} = undef;
    $self->{labelX} = undef;
    $self->{valueX} = 0;
    $self->{value} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $label, $x) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{LABEL} = $label;
        $self->{labelX} = $x;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $labelWidth = $graphics->getFont()->stringWidth($self->{LABEL}) - length($self->{LABEL});
        $self->{valueX} = $labelWidth + $self->{labelX};
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub paint {
    my ($self, $graphics, $y) = @_;
        $self->{myFontProcessor}->process($graphics);
        $graphics->drawString($self->{LABEL}, $self->{labelX}, $y, 0);
        $graphics->drawString($self->{value}, $self->{valueX}, $y, 0);
}


sub update {
    my ($self, $value) = @_;
        if (defined($value)) {
            $self->{value} = $value;
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::logic::string::StringUtil;

1;

