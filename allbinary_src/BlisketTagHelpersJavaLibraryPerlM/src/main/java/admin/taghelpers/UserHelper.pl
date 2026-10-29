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

package admin::taghelpers::UserHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::Table';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{hashMap} = undef;
    $self->{pageContext} = undef;
    $self->{request} = undef;
    $self->{path} = undef;
    $self->{portion} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{hashMap} = $hashMap;
        $self->{pageContext} = $pageContext;
        $self->{request} = $pageContext->getRequest();
        $self->{path} = 'org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH};
        $self->{portion} = 'org::allbinary::business::installer::Portion'->new($hashMap);
    return $self;
}


sub delete {
    my ($self) = @_;
        try {
            my $requestHashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($self->{request})->toHashMap();
            my $userName = 'org::allbinary::business::user::username::UserName'->new($requestHashMap);
            'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->deleteWhere($org::allbinary::business::user::UserData::USERNAME, $userName->get());
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Successfully Removed the user with ");
            $stringBuffer->append($org::allbinary::business::user::UserData::USERNAME);
            $stringBuffer->append("=");
            $stringBuffer->append($userName->get());
            $stringBuffer->append(" from to the user table");
            my $success = $stringBuffer->toString();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "delete()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to remove user with " . $org::allbinary::business::user::UserData::USERNAME . " from User table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e);
            }
            return $error;
        }
}


# throws Exception
sub insert {
    my ($self) = @_;
        try {
            my $userInterface = 'org::allbinary::business::user::NewUserFactory'->getInstance($self->{request}, $self->{hashMap});
            my $enable = $self->{hashMap}->get('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE});
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($enable)) {
                $userInterface->setEnable($enable);
            }
            my $values = $userInterface->toVector();
            'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->insert($values);
            my $success = "New User Successfully added to the Users Table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "add()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add User";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "add()", $e);
            }
            return $error;
        }
}


sub update {
    my ($self) = @_;
        try {
            my $user = 'org::allbinary::business::user::NewUserFactory'->getInstance($self->{request}, $self->{hashMap});
            my $values = $user->toHashMap();
            'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->update($user->getUserName(), $values);
            my $success = "New User Successfully added to the Users Table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add User";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}


sub drop {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->dropTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF($success, $self, $self->{commonStrings}->{DROP});
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to drop user table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{DROP}, $e);
            }
            return $error;
        }
}


sub create {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->createTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF($success, $self, "create()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to create user table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "create()", $e);
            }
            return $error;
        }
}


sub restore {
    my ($self) = @_;
        try {
            my $success = "Restore Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->restoreTable('org::allbinary::data::tables::user::UserEntityFactory'->getInstance(), $self->{portion});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "restore()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to restore backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "restore()", $e);
            }
            return $error;
        }
}


sub backup {
    my ($self) = @_;
        try {
            my $success = "Restore Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->backupTable('org::allbinary::data::tables::user::UserEntityFactory'->getInstance());
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                $self->{logUtil}->putF($success, $self, "backup()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to make backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backup()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::installer::Portion;
use org::allbinary::business::user::NewUserFactory;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::username::UserName;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlTableUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use admin::taghelpers::Table;

1;

