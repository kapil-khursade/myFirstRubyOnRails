class Permission < Struct.new(:member)

    def allow
        member && member.role == "admin" 
    end    
end    