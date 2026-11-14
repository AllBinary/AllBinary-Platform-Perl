# 
# To change this license header, choose License Headers in Project Properties. 
# To change this template file, choose Tools | Templates 
# and open the template in the editor.  
# Generated Code Do Not Modify

package org::allbinary::game::multiplayer::layer::RemoteInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

our $NEW_PLAYER_ID = 0;
tie our $REMOTE_INFO, 'java::lang::LazyStatic', sub { 'org::allbinary::game::multiplayer::layer::RemoteInfo'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, -1, -1, $org::allbinary::game::multiplayer::layer::RemoteInfo::NEW_PLAYER_ID) };


sub new {
    my ($class, $username, $actorSessionId, $playerInputId, $id) = @_;
    my $self = bless({}, $class);
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::string::StringUtil ();

1;

