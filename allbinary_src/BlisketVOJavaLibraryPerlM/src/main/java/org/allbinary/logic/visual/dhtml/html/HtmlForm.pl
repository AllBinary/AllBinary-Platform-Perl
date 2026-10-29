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

package org::allbinary::logic::visual::dhtml::html::HtmlForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{FORMBEGIN} = "<form ";
    $self->{END} = ">";
    $self->{FORMEND} = "</form>";
    $self->{ACTION} = "ACTION=\"";
    $self->{GET} = "GET\"";
    $self->{POST} = "POST\"";
    $self->{METHODS} = [$self->{GET}, $self->{POST}];
    $self->{METHOD} = "METHOD=\"";
    $self->{method} = undef;
    $self->{action} = undef;
    $self->{inputs} = undef;
}


sub new {
    my ($class, $action) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{action} = $action;
        $self->{inputs} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub setPost {
    my ($self) = @_;
        $self->{method} = $self->{POST};
}


sub setGet {
    my ($self) = @_;
        $self->{method} = $self->{GET};
}


sub addInput {
    my ($self, $htmlInput) = @_;
        $self->{inputs}->add($htmlInput);
}


sub addTable {
    my ($self, $htmlTable) = @_;
        $self->{inputs}->add($htmlTable);
}


sub toString {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $result = $stringUtil->{EMPTY_STRING};
        my $inputArray = $self->{inputs}->toArray();
        my $inputSize = scalar(@{$inputArray});
        $result = $self->{FORMBEGIN};
        $result .= $self->{METHOD};
        $result .= $self->{method};
        $result .= "\" ";
        $result .= $self->{ACTION};
        $result .= $self->{action};
        $result .= "\" ";
        $result .= $self->{END};
        for (my $i = 0; $i < $inputSize; $i++) {
            $result .= $inputArray->[$i]->toString();
            $result .= " ";
        }
        $result .= $self->{FORMEND};
        return $result;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::dhtml::html::input::HtmlInput;
use org::allbinary::logic::visual::dhtml::html::table::HtmlTable;

1;

