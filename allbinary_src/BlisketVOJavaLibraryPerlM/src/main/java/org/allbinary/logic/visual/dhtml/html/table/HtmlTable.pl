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

package org::allbinary::logic::visual::dhtml::html::table::HtmlTable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::html::HtmlTag';


sub _init_fields {
    my ($self) = @_;
    $self->{END} = ">";
    $self->{START} = "<table ";
    $self->{ENDTAG} = "</table>";
    $self->{CLASS} = "class";
    $self->{DIRECTION} = "dir";
    $self->{ID} = "id";
    $self->{LANG} = "lang";
    $self->{UNITS} = "units";
    $self->{BORDER} = "border";
    $self->{CELLPADDING} = "cellpadding";
    $self->{CELLSPACING} = "cellspacing";
    $self->{COLS} = "cols";
    $self->{FLOAT} = "float";
    $self->{FRAME} = "frame";
    $self->{RULES} = "rules";
    $self->{STYLE} = "style";
    $self->{BORDERCOLLAPSE} = "border-collapse: collapse";
    $self->{numberOfColumns} = 0;
    $self->{before} = undef;
    $self->{border} = undef;
    $self->{cellpadding} = undef;
    $self->{cellspacing} = undef;
    $self->{style} = undef;
    $self->{name} = undef;
    $self->{after} = undef;
    $self->{htmlRowsVector} = undef;
}


sub new {
    my ($class, $before, $cellpadding, $cellspacing, $after) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{before} = $before;
        $self->{cellpadding} = $cellpadding;
        $self->{cellspacing} = $cellspacing;
        $self->{after} = $after;
        $self->{htmlRowsVector} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->addAttribute($self->{BORDER}, 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->addAttribute($self->{CELLPADDING}, $self->{cellpadding});
        $self->addAttribute($self->{CELLSPACING}, $self->{cellspacing});
        $self->addAttribute($self->{STYLE}, $self->{BORDERCOLLAPSE});
    return $self;
}


sub addRow {
    my ($self, $htmlRow) = @_;
        if ($self->{numberOfColumns} < $htmlRow->getNumberOfColumns()) {
            $self->{numberOfColumns} = $htmlRow->getNumberOfColumns();
        }
        $self->{htmlRowsVector}->add($htmlRow);
}


sub toString {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $result = $stringUtil->{EMPTY_STRING};
        my $attributeKeys = $self->{otherAttributes}->keySet()->toArray();
        $result = $self->{before};
        $result .= $self->{START};
        $result .= " ";
        for (my $i = 0; $i < scalar(@{$attributeKeys}); $i++) {
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
        my $size = $self->{htmlRowsVector}->size();
        for (my $i = 0; $i < $size; $i++) {
            $result .= $self->{htmlRowsVector}->get($i)->toString();
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
use org::allbinary::string::CommonPhoneStrings;

1;

