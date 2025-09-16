import { AccessControl } from "accesscontrol";
import { Role } from "@prisma/client";

let grantsObject = {
  [Role.USER]: {
    "create:any": ["own"],
    "read:any": ["own"],
    "update:any": ["own"],
    "delete:any": ["own"]
  },
  [Role.SUPER]: {
    "create:any": ["*"],
    "read:any": ["*"],
    "update:any": ["*"],
    "delete:any": ["*"]
  }
}

export const ac = new AccessControl(grantsObject).lock();