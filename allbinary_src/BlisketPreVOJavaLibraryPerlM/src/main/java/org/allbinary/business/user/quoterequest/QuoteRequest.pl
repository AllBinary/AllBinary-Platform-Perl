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

package org::allbinary::business::user::quoterequest::QuoteRequest;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{id} = undef;
    $self->{userName} = undef;
    $self->{projectInfo} = undef;
    $self->{userComments} = undef;
    $self->{budget} = undef;
    $self->{timeFrame} = undef;
    $self->{comments} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of QuoteRequest takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $userName, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $quoteRequestData = 'org::allbinary::business::quoterequest::QuoteRequestData'->getInstance();
        $self->{id} = 'org::allbinary::data::generator::QuoteRequestIdGenerator'->new()->getNext();
        $self->setUserName($userName);
        $self->setProjectInfo($request->getParameter($quoteRequestData->{PROJECT_INFO}));
        $self->setUserComments($request->getParameter($quoteRequestData->{CUSTOMER_COMMENTS}));
        $self->setBudget($request->getParameter($quoteRequestData->{BUDGET}));
        $self->setTimeFrame($request->getParameter($quoteRequestData->{TIMEFRAME}));
        $self->setComments($request->getParameter($quoteRequestData->{COMMENTS}));
        if ($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
            $self->{logUtil}->putF("Created with: " . $self->toHashMap(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $quoteRequestData = 'org::allbinary::business::quoterequest::QuoteRequestData'->getInstance();
        $self->{id} = $hashMap->get($quoteRequestData->{ID});
        $self->setUserName($hashMap->get($org::allbinary::business::user::UserData::USERNAME));
        $self->setProjectInfo($hashMap->get($quoteRequestData->{PROJECT_INFO}));
        $self->setUserComments($hashMap->get($quoteRequestData->{CUSTOMER_COMMENTS}));
        $self->setBudget($hashMap->get($quoteRequestData->{BUDGET}));
        $self->setTimeFrame($hashMap->get($quoteRequestData->{TIMEFRAME}));
        $self->setComments($hashMap->get($quoteRequestData->{COMMENTS}));
        if ($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
            $self->{logUtil}->putF("Created with: " . $self->toHashMap(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            if (!defined($self->{userName}) || length($self->{userName}) < 4 || length($self->{userName}) > 250) {
                $valid = 0;
            }
            if (!defined($self->{projectInfo}) || length($self->{projectInfo}) < 0 || length($self->{projectInfo}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $valid = 0;
            }
            if (!defined($self->{userComments}) || length($self->{userComments}) < 0 || length($self->{userComments}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $valid = 0;
            }
            if (!defined($self->{budget}) || length($self->{budget}) < 0 || length($self->{budget}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $valid = 0;
            }
            if (!defined($self->{timeFrame}) || length($self->{timeFrame}) < 0 || length($self->{timeFrame}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $valid = 0;
            }
            if (!defined($self->{comments}) || length($self->{comments}) < 0 || length($self->{comments}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $valid = 0;
            }
            return $valid;
        } catch ($e) {
            if ($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (!defined($self->{userName}) || length($self->{userName}) < 4 || length($self->{userName}) > 250) {
                $stringBuffer->append("Please enter a User Name with more than 4 characters.<br>");
            }
            if (!defined($self->{projectInfo}) || length($self->{projectInfo}) < 0 || length($self->{projectInfo}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $stringBuffer->append("Please enter Project Info with less than " . $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB . " characters.<br>");
            }
            if (!defined($self->{userComments}) || length($self->{userComments}) < 0 || length($self->{userComments}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $stringBuffer->append("Please enter User Comments with less than " . $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB . " characters.<br>");
            }
            if (!defined($self->{budget}) || length($self->{budget}) < 0 || length($self->{budget}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $stringBuffer->append("Please enter Budget with less than " . $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB . " characters.<br>");
            }
            if (!defined($self->{timeFrame}) || length($self->{timeFrame}) < 0 || length($self->{timeFrame}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $stringBuffer->append("Please enter time frame with less than " . $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB . " characters.<br>");
            }
            if (!defined($self->{comments}) || length($self->{comments}) < 0 || length($self->{comments}) > $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB) {
                $stringBuffer->append("Please enter comments with less than " . $org::allbinary::logic::communication::sql::AbSqlData::MAXBLOB . " characters.<br>");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::quoterequest::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
        }
}


sub toVector {
    my ($self) = @_;
        my $values = 'org::allbinary::util::BasicArrayListD'->new();
        $values->add($self->{id});
        $values->add($self->{userName});
        $values->add($self->{projectInfo});
        $values->add($self->{userComments});
        $values->add($self->{budget});
        $values->add($self->{timeFrame});
        $values->add($self->{comments});
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $values->add($time);
        $values->add($time);
        return $values;
}


sub toHashMap {
    my ($self) = @_;
        my $quoteRequestData = 'org::allbinary::business::quoterequest::QuoteRequestData'->getInstance();
        my $values = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $values->put($org::allbinary::business::user::UserData::USERNAME, $self->{userName});
        $values->put($quoteRequestData->{PROJECT_INFO}, $self->{projectInfo});
        $values->put($quoteRequestData->{CUSTOMER_COMMENTS}, $self->{userComments});
        $values->put($quoteRequestData->{BUDGET}, $self->{budget});
        $values->put($quoteRequestData->{TIMEFRAME}, $self->{timeFrame});
        $values->put($quoteRequestData->{COMMENTS}, $self->{comments});
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $values->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        return $values;
}


sub setUserName {
    my ($self, $value) = @_;
        $self->{userName} = $value;
}


sub setProjectInfo {
    my ($self, $value) = @_;
        $self->{projectInfo} = $value;
}


sub setUserComments {
    my ($self, $value) = @_;
        $self->{userComments} = $value;
}


sub setBudget {
    my ($self, $value) = @_;
        $self->{budget} = $value;
}


sub setTimeFrame {
    my ($self, $value) = @_;
        $self->{timeFrame} = $value;
}


sub setComments {
    my ($self, $value) = @_;
        $self->{comments} = $value;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        if (!defined($self->{comments})) {
            $self->{comments} = $stringUtil->{EMPTY_STRING};
        }
}


sub getUserName {
    my ($self) = @_;
        return $self->{userName};
}


sub getProjectInfo {
    my ($self) = @_;
        return $self->{projectInfo};
}


sub getUserComments {
    my ($self) = @_;
        return $self->{userComments};
}


sub getBudget {
    my ($self) = @_;
        return $self->{budget};
}


sub getTimeFrame {
    my ($self) = @_;
        return $self->{timeFrame};
}


sub getComments {
    my ($self) = @_;
        return $self->{comments};
}

use java::util::Calendar;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::quoterequest::QuoteRequestData;
use org::allbinary::business::user::UserData;
use org::allbinary::data::generator::QuoteRequestIdGenerator;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

