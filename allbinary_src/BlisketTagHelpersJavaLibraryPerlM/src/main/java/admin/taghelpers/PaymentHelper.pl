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

package admin::taghelpers::PaymentHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::Table';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{request} = undef;
    $self->{value} = undef;
    $self->{portion} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{request} = $pageContext->getRequest();
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        $self->{portion} = 'org::allbinary::business::installer::Portion'->new($hashMap);
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{value} = $self->{request}->getParameter("VALUE");
}


sub insert {
    my ($self) = @_;
        try {
            my $success = "Successfully Added Payment";
            my $paymentEntity = 'org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance();
            my $paymentInterface = 'org::allbinary::business::user::commerce::money::payment::PaymentFactory'->getInstance($self->{request});
            $paymentEntity->add($self->{weblisketSession}->getUserName(), $paymentInterface);
            $paymentEntity->setDefault($self->{weblisketSession}->getUserName(), $paymentEntity->getLastId($self->{weblisketSession}->getUserName()));
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "addPayment()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add Payment";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "addPayment()", $e);
            }
            return $error;
        }
}


sub select {
    my ($self) = @_;
        try {
            my $success = "Successfully Selected Payment";
            my $paymentEntity = 'org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance();
            $paymentEntity->setDefault($self->{weblisketSession}->getUserName(), $self->{value});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "selectPayment()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to select Payment";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "selectPayment()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        try {
            my $success = "Successfully Removed Payment";
            my $paymentEntity = 'org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance();
            $paymentEntity->remove($self->{weblisketSession}->getUserName(), $self->{value});
            my $paymentInterface = $paymentEntity->getDefault($self->{weblisketSession}->getUserName());
            if (!defined($paymentInterface)) {
                $paymentEntity->setDefault($self->{weblisketSession}->getUserName(), $paymentEntity->getLastId($self->{weblisketSession}->getUserName()));
            }
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "removePayment()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to remove Payment";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "removePayment()", $e);
            }
            return $error;
        }
}


sub drop {
    my ($self) = @_;
        try {
            my $paymentEntity = 'org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance();
            my $success = $paymentEntity->dropTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, $self->{commonStrings}->{DROP});
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to drop Admin table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{DROP}, $e);
            }
            return $error;
        }
}


sub create {
    my ($self) = @_;
        try {
            my $paymentEntity = 'org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance();
            my $success = $paymentEntity->createTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "create()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to create user table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "create()", $e);
            }
            return $error;
        }
}


sub restore {
    my ($self) = @_;
        try {
            my $success = "Restore Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->restoreTable('org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance(), $self->{portion});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "restore()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to restore backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "restore()", $e);
            }
            return $error;
        }
}


sub backup {
    my ($self) = @_;
        try {
            my $success = "Backup Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->backupTable('org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance());
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "backup()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to make backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backup()", $e);
            }
            return $error;
        }
}


# throws LicensingException
sub update {
    my ($self) = @_;
        return $self->{commonStrings}->{NOT_IMPLEMENTED};
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::installer::Portion;
use org::allbinary::business::user::commerce::money::payment::PaymentFactory;
use org::allbinary::business::user::commerce::money::payment::PaymentInterface;
use org::allbinary::data::tables::user::commerce::money::payment::PaymentEntity;
use org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlTableUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use admin::taghelpers::Table;

1;

