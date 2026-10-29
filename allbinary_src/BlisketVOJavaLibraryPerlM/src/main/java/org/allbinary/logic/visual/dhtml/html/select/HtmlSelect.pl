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

package org::allbinary::logic::visual::dhtml::html::select::HtmlSelect;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::html::HtmlTag';


sub _init_fields {
    my ($self) = @_;
    $self->{END} = ">";
    $self->{STARTSELECT} = "<SELECT ";
    $self->{ENDSELECT} = "</SELECT>";
    $self->{SIZE} = "SIZE=\"";
    $self->{NAME} = "NAME=\"";
    $self->{STARTOPTION} = "<OPTION";
    $self->{SELETED} = "SELECTED";
    $self->{ENDOPTION} = "</OPTION>";
    $self->{before} = undef;
    $self->{name} = undef;
    $self->{after} = undef;
    $self->{size} = undef;
    $self->{selected} = undef;
    $self->{options} = undef;
    $self->{multiple} = "multiple";
    $self->{isMultipleSelect} = 0;
}


sub new {
    my ($class, $before, $size, $name, $after) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{before} = $before;
        $self->{size} = $size;
        $self->{name} = $name;
        $self->{after} = $after;
        $self->{options} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub addOption {
    my ($self, $key) = @_;
        $self->{options}->add($key);
}


sub addOptions {
    my ($self, $fileName) = @_;
        try {
            my $lineReader = 'org::allbinary::logic::io::LineReader'->new($fileName);
            while ($lineReader->hasNext()) {
                my $option = $lineReader->next();
                $self->addOption($option);
            }
        } catch ($e) {
            $self->addOption("Error");
        }
}


sub setSelected {
    my ($self, $selected) = @_;
        $self->{selected} = $selected;
}


sub isMultiple {
    my ($self) = @_;
        return $self->{isMultipleSelect};
}


sub setMultiple {
    my ($self, $value) = @_;
        $self->{isMultipleSelect} = $value;
}


sub getOptions {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $result = $stringUtil->{EMPTY_STRING};
        my $optionsArray = $self->{options}->toArray();
        my $optionsSize = scalar(@{$optionsArray});
        for (my $i = 0; $i < $optionsSize; $i++) {
            my $value = $optionsArray->[$i];
            if (defined($value) && $value->compareTo($stringUtil->{EMPTY_STRING}) != 0) {
                $result .= $self->{STARTOPTION};
                $result .= $self->{END};
                $result .= $value;
                $result .= $self->{ENDOPTION};
            }
        }
        return $result;
}


sub toString {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $result = $stringUtil->{EMPTY_STRING};
        my $attributeKeys = $self->{otherAttributes}->keySet()->toArray();
        my $attributeSize = scalar(@{$attributeKeys});
        $result = $self->{before};
        $result .= $self->{STARTSELECT};
        $result .= $self->{NAME};
        $result .= $self->{name};
        $result .= "\" ";
        $result .= $self->{SIZE};
        $result .= $self->{size};
        $result .= "\" ";
        for (my $i = 0; $i < $attributeSize; $i++) {
            my $key = $attributeKeys->[$i];
            my $value = $self->{otherAttributes}->get($key);
            if (defined($value) && $value->compareTo($stringUtil->{EMPTY_STRING}) != 0) {
                $result .= $key;
                $result .= "=\"";
                $result .= $value;
                $result .= "\" ";
            }
        }
        if ($self->isMultiple()) {
            $result .= " " . $self->{multiple} . " ";
        }
        $result .= $self->{END};
        $result .= $self->getOptions();
        $result .= $self->{ENDSELECT};
        $result .= $self->{after};
        return $result;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::io::LineReader;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::dhtml::html::HtmlTag;

1;

