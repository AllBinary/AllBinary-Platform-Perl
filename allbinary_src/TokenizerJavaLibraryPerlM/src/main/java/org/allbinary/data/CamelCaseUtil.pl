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

package org::allbinary::data::CamelCaseUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::CamelCaseUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::CamelCaseUtil::instance;
}


# throws Exception
sub getAsCamelCase {
    my ($self, $string, $stringBuilder) = @_;
        if (!defined($string)) {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        $stringBuilder->delete(0, $stringBuilder->length());
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $tokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new($self->{commonSeps}->{UNDERSCORE});
        $tokenizer->getTokensFromString($string, $list);
        my $size = $list->size();
        my $word = undef;
        for (my $i = 0; $i < $size; $i++) {
            $word = $list->get($i);
            $word = ($stringValidationUtil->isEmpty($word) ? $word : 'org::allbinary::logic::string::StringMaker'->new()->appendchar(uc(substr($word, 0, 1)))->append(lc(substr($word, 1)))->toString());
            $stringBuilder->append($word);
        }
        return $stringBuilder->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::string::tokens::Tokenizer;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

