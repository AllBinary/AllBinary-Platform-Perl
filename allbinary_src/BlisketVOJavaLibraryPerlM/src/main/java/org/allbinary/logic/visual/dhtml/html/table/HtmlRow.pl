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

package org::allbinary::logic::visual::dhtml::html::table::HtmlRow;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::html::HtmlTag';


sub _init_fields {
    my ($self) = @_;
    $self->{END} = ">";
    $self->{START} = "<tr ";
    $self->{ENDTAG} = "</tr>";
    $self->{numberOfColumns} = 0;
    $self->{before} = undef;
    $self->{after} = undef;
    $self->{htmlCellsVector} = undef;
}


sub new {
    my ($class, $before, $after) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{before} = ("" . $before);
        $self->{after} = ("" . $after);
        $self->{htmlCellsVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub addCell {
    my ($self, $htmlCell) = @_;
        $self->{htmlCellsVector}->add($htmlCell);
        $self->{numberOfColumns}++;
}


sub getNumberOfColumns {
    my ($self) = @_;
        return $self->{numberOfColumns};
}


sub toString {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $result = $stringUtil->{EMPTY_STRING};
        my $attributeKeys = $self->{otherAttributes}->keySet()->toArray();
        my $attributeSize = scalar(@{$attributeKeys});
        my $cellSize = $self->{htmlCellsVector}->size();
        $result = $self->{before};
        $result .= $self->{START};
        $result .= " ";
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
        for (my $i = 0; $i < $cellSize; $i++) {
            $result .= $self->{htmlCellsVector}->get($i)->toString();
            $result .= " ";
        }
        $result .= $self->{ENDTAG};
        $result .= $self->{after};
        return $result;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::dhtml::html::HtmlTag;

1;

