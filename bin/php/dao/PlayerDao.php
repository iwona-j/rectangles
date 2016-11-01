<?php
require_once "./dto/PlayerDto.php";
class PlayerDao
{
    public function findPlayersByGame($pdo, $gameId){
        $sql = "SELECT * FROM PLAYER WHERE PLAYER.GAME_ID = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array(
                $gameId
            )
        );
        return $stmt -> rowCount() == 0 ? array() : $stmt -> fetchAll();
    }

    public function findPlayersByGameAsDto($pdo, $gameId){
        $result = array();
        $fetchResultList = $this->findPlayersByGame($pdo, $gameId);
        foreach ($fetchResultList as &$fetchResult) {
            $player = new PlayerDto();
            $player -> from($fetchResult);
            array_push($result, $player);
        }
        return $result;
    }
}


?>