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

package org::allbinary::business::user::commerce::money::payment::gateway::transaction::TransactionResult;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::money::payment::gateway::transaction::TransactionResultInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{keyValuePairs} = undef;
    $self->{result} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TransactionResult takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $result) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            $self->{result} = $result;
            my $tokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new('org::allbinary::string::CommonSeps'->getInstance()->{AMPERSAND});
            my $tokens = $tokenizer->getTokensFromString($result, 'org::allbinary::util::BasicArrayListD'->new());
            my $tokenizer2 = 'org::allbinary::logic::string::tokens::Tokenizer'->new('org::allbinary::string::CommonSeps'->getInstance()->{EQUALS});
            my $hashtable = $tokenizer2->getTokens($tokens);
            $self->{keyValuePairs}->putAll($hashtable);
        } catch ($e) {
            my $exceptionMessage = "TransactionResult Constructor Failed";
            $self->{logUtil}->putF($exceptionMessage, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub _new1 {
    my ($class, $keyValuePairs) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $keyValuePairs = $keyValuePairs;
        $self->{result} = "Needs to have the hashmap converted to string for other constructor";
    return $self;
}


sub toString {
    my ($self) = @_;
        return $self->{result};
}


sub toHashMap {
    my ($self) = @_;
        return $self->{keyValuePairs};
}


sub getAllPossibleKeys {
    my ($self) = @_;
        my $paymentTransactionKeysFactory = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance();
        my $verisignResponseKeys = 'org::allbinary::util::BasicArrayListD'->new();
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{RESULT}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{PNREF}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{RESPMSG}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{AUTHCODE}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{AVSADDR}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{AVSZIP}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{ORIGRESULT}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{STATUS}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{FRAUDCODE}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{FRAUDMSG}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{ERRCODE}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{SCORE}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{REASON1}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{REASON2}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{REASON3}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{EXCEPTION1}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{EXCEPTION2}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{EXCEPTION3}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{EXCEPTION4}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{EXCEPTION5}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{EXCEPTION6}->toString());
        $verisignResponseKeys->add($paymentTransactionKeysFactory->{EXCEPTION7}->toString());
        return $verisignResponseKeys;
}


sub getValues {
    my ($self) = @_;
        my $keyVector = $self->getAllPossibleKeys();
        my $valueVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $keyVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $key = $keyVector->get($i);
            if ($self->{keyValuePairs}->containsKey($key)) {
                $valueVector->add($self->{keyValuePairs}->get($key));
            } else {
                my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
                $valueVector->add($stringUtil->{EMPTY_STRING});
            }
        }
        return $valueVector;
}


sub getPnRef {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{PNREF}->toString());
}


sub getRespMsg {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{RESPMSG}->toString());
}


sub getResult {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{RESULT}->toString());
}


sub getScore {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{SCORE}->toString());
}


sub getStatus {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{STATUS}->toString());
}


sub getFraudCode {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{FRAUDCODE}->toString());
}


sub getFraudMsg {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{FRAUDMSG}->toString());
}


sub getOrigResult {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{ORIGRESULT}->toString());
}


sub getAvsAddr {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{AVSADDR}->toString());
}


sub getAvsZip {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{AVSZIP}->toString());
}


sub getErrCode {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{ERRCODE}->toString());
}


sub getException1 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{EXCEPTION1}->toString());
}


sub getException2 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{EXCEPTION2}->toString());
}


sub getException3 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{EXCEPTION3}->toString());
}


sub getException4 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{EXCEPTION4}->toString());
}


sub getException5 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{EXCEPTION5}->toString());
}


sub getException6 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{EXCEPTION6}->toString());
}


sub getException7 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{EXCEPTION7}->toString());
}


sub getReason1 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{REASON1}->toString());
}


sub getReason2 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{REASON2}->toString());
}


sub getReason3 {
    my ($self) = @_;
        return $self->{keyValuePairs}->get('org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->getInstance()->{REASON3}->toString());
}

use java::util::HashMap;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::tokens::Tokenizer;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::TransactionResultInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory;

1;

