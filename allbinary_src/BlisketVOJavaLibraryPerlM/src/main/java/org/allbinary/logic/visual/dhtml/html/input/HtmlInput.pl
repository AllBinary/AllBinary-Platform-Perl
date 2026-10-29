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

package org::allbinary::logic::visual::dhtml::html::input::HtmlInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::html::HtmlTag';


sub _init_fields {
    my ($self) = @_;
    $self->{END} = ">";
    $self->{STARTINPUT} = "<INPUT ";
    $self->{ENDINPUT} = "</INPUT>";
    $self->{TYPE} = "TYPE=\"";
    $self->{NAME} = "NAME=\"";
    $self->{before} = undef;
    $self->{type} = undef;
    $self->{name} = undef;
    $self->{after} = undef;
}


sub new {
    my ($class, $before, $type, $name, $after) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{before} = $before;
        $self->{type} = $type;
        $self->{name} = $name;
        $self->{after} = $after;
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $result = $stringUtil->{EMPTY_STRING};
        my $attributeKeys = $self->{otherAttributes}->keySet()->toArray();
        my $attributeSize = scalar(@{$attributeKeys});
        $result = $self->{before};
        $result .= $self->{STARTINPUT};
        $result .= $self->{TYPE};
        $result .= $self->{type};
        $result .= "\" ";
        $result .= $self->{NAME};
        $result .= $self->{name};
        $result .= "\" ";
        for (my $i = 0; $i < $attributeSize; $i++) {
            my $key = $attributeKeys->[$i];
            my $value = $self->{otherAttributes}->get($key);
            if (defined($value) && ($value cmp $stringUtil->{EMPTY_STRING}) != 0) {
                $result .= $key;
                $result .= "=\"";
                $result .= $value;
                $result .= "\" ";
            }
        }
        $result .= $self->{END};
        $result .= $self->{ENDINPUT};
        $result .= $self->{after};
        return $result;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::dhtml::html::HtmlTag;

1;

