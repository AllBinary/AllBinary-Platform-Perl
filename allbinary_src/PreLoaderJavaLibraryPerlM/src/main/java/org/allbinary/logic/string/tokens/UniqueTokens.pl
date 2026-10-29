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

package org::allbinary::logic::string::tokens::UniqueTokens;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{specialCharacters} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{specialCharacters}->add("!");
        $self->{specialCharacters}->add("\@");
        $self->{specialCharacters}->add('org::allbinary::string::CommonPhoneStrings'->getInstance()->{POUND});
        $self->{specialCharacters}->add("\$");
        $self->{specialCharacters}->add("%");
        $self->{specialCharacters}->add("^");
        $self->{specialCharacters}->add('org::allbinary::string::CommonSeps'->getInstance()->{AMPERSAND});
        $self->{specialCharacters}->add('org::allbinary::string::CommonPhoneStrings'->getInstance()->{STAR});
        $self->{specialCharacters}->add("(");
        $self->{specialCharacters}->add(")");
        $self->{specialCharacters}->add("-");
        $self->{specialCharacters}->add("_");
        $self->{specialCharacters}->add("+");
        $self->{specialCharacters}->add("=");
        $self->{specialCharacters}->add("\\");
        $self->{specialCharacters}->add("|");
        $self->{specialCharacters}->add('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
        $self->{specialCharacters}->add(",");
        $self->{specialCharacters}->add("<");
        $self->{specialCharacters}->add(">");
        $self->{specialCharacters}->add("?");
        $self->{specialCharacters}->add("/");
        $self->{specialCharacters}->add("~");
        $self->{specialCharacters}->add("`");
    return $self;
}


# throws Exception
sub getWhithoutDashesAndSkipNumberOnlyTokens {
    my ($self, $stringVector) = @_;
        try {
            my $hashSet = 'java::util::HashSet'->new();
            my $index = 0;
            my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
            while ($index < $stringVector->size()) {
                my $keywords = $stringVector->get($index);
                my $tokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new($commonSeps->{COMMA});
                my $keywordVector = $tokenizer->getTokensFromString($keywords, 'org::allbinary::util::BasicArrayListD'->new());
                for (my $forIndex = 0; $forIndex < $keywordVector->size(); $forIndex++) {
                    my $cleanString = $keywordVector->get($forIndex);
                    $cleanString = ($cleanString =~ s/^\s+|\s+$//gr);
                    if (index($cleanString, "-") != -1) {
                        $cleanString = 'org::allbinary::logic::string::regex::replace::Replace'->new("-", $commonSeps->{SPACE})->all($cleanString);
                    }
                    $hashSet->add($cleanString);
                    if (index($cleanString, " ") != -1) {
                        my $spaceTokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new($commonSeps->{SPACE});
                        my $subKeywordVector = $spaceTokenizer->getTokensFromString($cleanString, 'org::allbinary::util::BasicArrayListD'->new());
                        for (my $spaceIndex = 0; $spaceIndex < $subKeywordVector->size(); $spaceIndex++) {
                            my $subCleanString = $subKeywordVector->get($spaceIndex);
                            if (!$self->isSpecialCharacter($subCleanString) && !$self->numberOnly($subCleanString)) {
                                $hashSet->add($subCleanString);
                            }
                        }
                    }
                }
                $index++;
            }
            return $hashSet;
        } catch ($e) {
            die $e;
        }
}


sub numberOnly {
    my ($self, $subCleaningString) = @_;
        try {
            int($subCleaningString);
            return 1;
        } catch ($e) {
            return 0;
        }
}


sub isSpecialCharacter {
    my ($self, $subCleaningString) = @_;
        for (my $index = 0; $index < $self->{specialCharacters}->size(); $index++) {
            if (($subCleaningString cmp $self->{specialCharacters}->get($index)) == 0) {
                return 1;
            }
        }
        return 0;
}

# use java::util::HashSet;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::string::tokens::Tokenizer;

1;

